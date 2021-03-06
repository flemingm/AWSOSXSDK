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

#import "SimpleDBBatchPutAttributesResponse.h"

@implementation SimpleDBBatchPutAttributesResponse


- (id)init {
    return [super init];
}

- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"DuplicateItemName"]) {
        newException = [[SimpleDBDuplicateItemNameException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InvalidParameterValue"]) {
        newException = [[SimpleDBInvalidParameterValueException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"NumberDomainBytesExceeded"]) {
        newException = [[SimpleDBNumberDomainBytesExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"NumberSubmittedItemsExceeded"]) {
        newException = [[SimpleDBNumberSubmittedItemsExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"NumberSubmittedAttributesExceeded"]) {
        newException = [[SimpleDBNumberSubmittedAttributesExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"NumberDomainAttributesExceeded"]) {
        newException = [[SimpleDBNumberDomainAttributesExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"NoSuchDomain"]) {
        newException = [[SimpleDBNoSuchDomainException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"NumberItemAttributesExceeded"]) {
        newException = [[SimpleDBNumberItemAttributesExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"MissingParameter"]) {
        newException = [[SimpleDBMissingParameterException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        exception = newException;
    }
    else {
        exception = theException;
    }
}

- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
