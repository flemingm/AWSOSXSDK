/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "S3MultipartUploadOperation_Internal.h"
#import "AmazonErrorHandler.h"

typedef void (^AbortMultipartUploadBlock)();

@interface S3MultipartUploadOperation_Internal () {
    BOOL _isExecuting;
    BOOL _isFinished;
}

@property (nonatomic, assign) NSUInteger contentLength;
@property (nonatomic, assign) NSUInteger currentPartNo;
@property (nonatomic, assign) NSInteger numberOfParts;
@property (nonatomic, assign) NSInteger retryCount;
@property (nonatomic, copy) AbortMultipartUploadBlock abortMultipartUpload;
@property (nonatomic, strong) S3InitiateMultipartUploadRequest *x_initRequest;
@property (nonatomic, strong) S3InitiateMultipartUploadResponse *x_initResponse;
@property (nonatomic, strong) S3MultipartUpload *multipartUpload;
@property (nonatomic, strong) S3CompleteMultipartUploadRequest *completeRequest;
@property (nonatomic, strong) NSData *dataForPart;

@end

@implementation S3MultipartUploadOperation_Internal

@synthesize delegate = _delegate;
@synthesize s3 = _s3;

@synthesize contentLength = _contentLength;
@synthesize currentPartNo = _currentPartNo;
@synthesize numberOfParts = _numberOfParts;
@synthesize retryCount = _retryCount;
@synthesize abortMultipartUpload = _abortMultipartUpload;
@synthesize x_initRequest = _initRequest;
@synthesize x_initResponse = _initResponse;
@synthesize multipartUpload = _multipartUpload;
@synthesize completeRequest = _completeRequest;
@synthesize dataForPart = _dataForPart;

#pragma mark - Class Lifecycle

- (id)init {
    if (self = [super init]) {
        _isExecuting = NO;
        _isFinished = NO;

        _contentLength = 0;
        _currentPartNo = 0;
        _numberOfParts = 0;
        _retryCount = 0;
    }

    return self;
}


#pragma mark - Overwriding NSOperation Methods

- (void)start {
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];

    [self initiateUpload];
}

- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return _isExecuting;
}

- (BOOL)isFinished {
    return _isFinished;
}

#pragma mark - Multipart Upload Methods

- (void)initiateUpload {
    self.x_initRequest =
            [[S3InitiateMultipartUploadRequest alloc] initWithKey:self.request.key
                                                         inBucket:self.request.bucket];
    self.x_initRequest.cannedACL = self.request.cannedACL;
    self.x_initRequest.storageClass = self.request.storageClass;
    self.x_initRequest.serverSideEncryption = self.request.serverSideEncryption;
    self.x_initRequest.fullACL = self.request.fullACL;
    self.x_initRequest.authorization = self.request.authorization;
    self.x_initRequest.contentType = self.request.contentType;
    self.x_initRequest.securityToken = self.request.securityToken;
    self.x_initRequest.subResource = self.request.subResource;

    self.x_initRequest.cacheControl = self.request.cacheControl;
    self.x_initRequest.contentDisposition = self.request.contentDisposition;
    self.x_initRequest.contentEncoding = self.request.contentEncoding;
    self.x_initRequest.redirectLocation = self.request.redirectLocation;

    self.x_initRequest.delegate = self;

    self.retryCount = 0;
    self.response = nil;

    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.s3 initiateMultipartUpload:self.x_initRequest];
    });
}

- (void)startUploadingParts {
    self.completeRequest = [[S3CompleteMultipartUploadRequest alloc] initWithMultipartUpload:self.multipartUpload];
    self.completeRequest.delegate = self;

    self.abortMultipartUpload = ^{

        if (self.multipartUpload) {
            @try {
                S3AbortMultipartUploadRequest *abortRequest = [[S3AbortMultipartUploadRequest alloc] initWithMultipartUpload:self.multipartUpload];
                [self.s3 abortMultipartUpload:abortRequest];
            }
            @catch (NSException *exception) {

            }
        }

    };

    self.contentLength = [self contentLengthForRequest:self.request];
    self.numberOfParts = [self numberOfParts:self.contentLength];
    self.currentPartNo = 1;

    self.retryCount = 0;
    [self uploadPart:self.currentPartNo];
}

- (void)uploadPart:(NSInteger)partNo {
    NSRange dataRange = [self getDataRange:partNo withContentLength:self.contentLength];

    self.error = nil;
    self.exception = nil;

    if (self.retryCount > 0) {
        [self.s3 pauseExponentially:self.retryCount];
    }

    S3UploadPartRequest *uploadRequest = [[S3UploadPartRequest alloc] initWithMultipartUpload:self.multipartUpload];
    uploadRequest.partNumber = partNo;

    if (self.dataForPart == nil) {
        if (self.request.data != nil) {
            self.dataForPart = [self.request.data subdataWithRange:dataRange];
        }
        else {
            if (self.request.stream.streamStatus == NSStreamStatusNotOpen) {
                [self.request.stream open];
            }

            NSMutableData *dataForPart = [NSMutableData new];

            uint8_t buffer[1024];
            NSUInteger readLength = 0;

            for (int i = 0; i < ceil((double) self.partSize / 1024); i++) {
                readLength = [self.request.stream read:buffer maxLength:1024];
                [dataForPart appendData:[NSData dataWithBytes:buffer length:readLength]];
            }

            self.dataForPart = dataForPart;

        }
    }

    uploadRequest.contentLength = self.dataForPart.length;
    uploadRequest.data = self.dataForPart;
    uploadRequest.delegate = self;

    self.response = nil;

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.s3 uploadPart:uploadRequest];
    });

}

#pragma mark - AmazonServiceRequestDelegate Implementations

- (void)request:(AmazonServiceRequest *)request didCompleteWithResponse:(AmazonServiceResponse *)response {
    if (!self.isFinished && self.isExecuting) {
        self.response = response;

        if ([response isKindOfClass:[S3InitiateMultipartUploadResponse class]]) {
            self.x_initResponse = (S3InitiateMultipartUploadResponse *) self.response;
            self.multipartUpload = self.x_initResponse.multipartUpload;

            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{

                [self startUploadingParts];
            });
        }
        else if ([response isKindOfClass:[S3UploadPartResponse class]]) {
            AMZLogDebug(@"UploadPart succeeded: %ld", (unsigned long) self.currentPartNo);

            S3UploadPartResponse *uploadPartResponse = (S3UploadPartResponse *) self.response;

            if (uploadPartResponse.etag == nil) {
                [self.s3 completeMultipartUpload:self.completeRequest];
            }
            else {
                [self.completeRequest addPartWithPartNumber:self.currentPartNo withETag:uploadPartResponse.etag];

                self.dataForPart = nil;
                self.retryCount = 0;

                if (self.currentPartNo < self.numberOfParts) {
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                    dispatch_async(queue, ^{

                        self.currentPartNo++;
                        [self uploadPart:self.currentPartNo];
                    });
                }
                else {
                    if (self.request.stream) {
                        [self.request.stream close];
                    }

                    [self.s3 completeMultipartUpload:self.completeRequest];
                }
            }
        }
        else if ([response isKindOfClass:[S3CompleteMultipartUploadResponse class]]) {
            if ([self.delegate respondsToSelector:@selector(request:didCompleteWithResponse:)]) {
                [self.delegate request:request
               didCompleteWithResponse:response];
            }

            [self finish];
        }
    }
}

- (void)request:(AmazonServiceRequest *)request didSendData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
    if (!self.isFinished && self.isExecuting) {
        if ([request isKindOfClass:[S3UploadPartRequest class]]) {
            if ([self.delegate respondsToSelector:@selector(request:didSendData:totalBytesWritten:totalBytesExpectedToWrite:)]) {
                [self.delegate request:request
                           didSendData:bytesWritten
                     totalBytesWritten:(self.currentPartNo - 1) * self.partSize + totalBytesWritten
             totalBytesExpectedToWrite:self.contentLength];
            }
        }
    }
}

- (void)request:(AmazonServiceRequest *)request didFailWithError:(NSError *)error {
    if (!self.isFinished && self.isExecuting) {
        AMZLogDebug(@"Error: %@", error);

        self.error = error;
        self.exception = [AmazonServiceException exceptionWithMessage:[error description] andError:error];

        if ((self.s3.maxRetries > self.retryCount && (self.error || self.exception))
                && [self.s3 shouldRetry:nil exception:self.exception]
                && [self isExecuting]) {
            AMZLogDebug(@"Retrying %@", [request class]);

            self.response = nil;
            self.retryCount++;

            if ([request isKindOfClass:[S3InitiateMultipartUploadRequest class]]) {
                [self.s3 initiateMultipartUpload:self.x_initRequest];
            }
            else if ([request isKindOfClass:[S3UploadPartRequest class]]) {
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(queue, ^{

                    [self uploadPart:self.currentPartNo];
                });
            }
            else if ([request isKindOfClass:[S3CompleteMultipartUploadRequest class]]) {
                [self.s3 completeMultipartUpload:self.completeRequest];
            }

            return;
        }

        if (self.abortMultipartUpload) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, self.abortMultipartUpload);
        }

        if ([self.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
            [self.delegate request:request didFailWithError:error];
        }

        [self finish];
    }
}

- (void)request:(AmazonServiceRequest *)request didFailWithServiceException:(NSException *)exception {
    if (!self.isFinished && self.isExecuting) {
        AMZLogDebug(@"Exception: %@", exception);

        self.exception = exception;

        if ((self.s3.maxRetries > self.retryCount && (self.error || self.exception))
                && [self.s3 shouldRetry:nil exception:self.exception]
                && [self isExecuting]) {
            AMZLogDebug(@"Retrying %@", [request class]);

            self.response = nil;
            self.retryCount++;

            if ([request isKindOfClass:[S3InitiateMultipartUploadRequest class]]) {
                [self.s3 initiateMultipartUpload:self.x_initRequest];
            }
            else if ([request isKindOfClass:[S3UploadPartRequest class]]) {
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(queue, ^{

                    [self uploadPart:self.currentPartNo];
                });
            }
            else if ([request isKindOfClass:[S3CompleteMultipartUploadRequest class]]) {
                [self.s3 completeMultipartUpload:self.completeRequest];
            }

            return;
        }

        if (self.abortMultipartUpload) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, self.abortMultipartUpload);
        }

        if ([self.delegate respondsToSelector:@selector(request:didFailWithServiceException:)]) {
            [self.delegate request:request didFailWithServiceException:exception];
        }

        [self finish];
    }
}

#pragma mark - Helper Methods

- (void)finish {
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];

    _isExecuting = NO;
    _isFinished = YES;

    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (NSRange)getDataRange:(int)partNo withContentLength:(NSInteger)contentLength {
    NSRange range;
    range.length = self.partSize;
    range.location = (partNo - 1) * self.partSize;

    int maxByte = partNo * self.partSize;
    if (contentLength < maxByte) {
        range.length = contentLength - range.location;
    }

    return range;
}

- (NSUInteger)contentLengthForRequest:(S3PutObjectRequest *)request {
    if (request.data != nil) {
        return self.request.data.length;
    }
    else {
        return request.contentLength;
    }
}

- (NSUInteger)numberOfParts:(NSUInteger)contentLength {
    return (NSUInteger) ceil((double) contentLength / self.partSize);
}

#pragma mark -

@end
