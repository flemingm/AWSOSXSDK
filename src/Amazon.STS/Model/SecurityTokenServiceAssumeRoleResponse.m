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

#import "SecurityTokenServiceAssumeRoleResponse.h"


@implementation SecurityTokenServiceAssumeRoleResponse

@synthesize credentials;
@synthesize assumedRoleUser;
@synthesize packedPolicySize;


- (id)init {
    if (self = [super init]) {
        credentials = nil;
        assumedRoleUser = nil;
        packedPolicySize = nil;
    }

    return self;
}


- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"PackedPolicyTooLarge"]) {
        newException = [[SecurityTokenServicePackedPolicyTooLargeException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"MalformedPolicyDocument"]) {
        newException = [[SecurityTokenServiceMalformedPolicyDocumentException alloc] initWithMessage:@""];
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
    [buffer appendString:[[NSString alloc] initWithFormat:@"Credentials: %@,", credentials]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AssumedRoleUser: %@,", assumedRoleUser]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"PackedPolicySize: %@,", packedPolicySize]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
