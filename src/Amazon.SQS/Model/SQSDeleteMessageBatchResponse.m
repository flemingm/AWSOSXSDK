/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "SQSDeleteMessageBatchResponse.h"


@implementation SQSDeleteMessageBatchResponse

@synthesize successful;
@synthesize failed;


- (id)init {
    if (self = [super init]) {
        successful = [[NSMutableArray alloc] initWithCapacity:1];
        failed = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"AWS.SimpleQueueService.BatchEntryIdsNotDistinct"]) {
        newException = [[SQSBatchEntryIdsNotDistinctException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"AWS.SimpleQueueService.TooManyEntriesInBatchRequest"]) {
        newException = [[SQSTooManyEntriesInBatchRequestException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"AWS.SimpleQueueService.InvalidBatchEntryId"]) {
        newException = [[SQSInvalidBatchEntryIdException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"AWS.SimpleQueueService.EmptyBatchRequest"]) {
        newException = [[SQSEmptyBatchRequestException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        exception = newException;
    }
    else {
        exception = theException;
    }
}


- (SQSDeleteMessageBatchResponseEntry *)successfulObjectAtIndex:(int)index {
    return (SQSDeleteMessageBatchResponseEntry *) successful[index];
}


- (SQSBatchResponseErrorEntry *)failedObjectAtIndex:(int)index {
    return (SQSBatchResponseErrorEntry *) failed[index];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Successful: %@,", successful]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Failed: %@,", failed]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
