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

#import "SimpleDBDomainMetadataResponse.h"


@implementation SimpleDBDomainMetadataResponse

@synthesize itemCount;
@synthesize itemNamesSizeBytes;
@synthesize attributeNameCount;
@synthesize attributeNamesSizeBytes;
@synthesize attributeValueCount;
@synthesize attributeValuesSizeBytes;
@synthesize timestamp;


- (id)init {
    if (self = [super init]) {
        itemCount = nil;
        itemNamesSizeBytes = nil;
        attributeNameCount = nil;
        attributeNamesSizeBytes = nil;
        attributeValueCount = nil;
        attributeValuesSizeBytes = nil;
        timestamp = nil;
    }

    return self;
}


- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"NoSuchDomain"]) {
        newException = [[SimpleDBNoSuchDomainException alloc] initWithMessage:@""];
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
    [buffer appendString:[[NSString alloc] initWithFormat:@"ItemCount: %@,", itemCount]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ItemNamesSizeBytes: %@,", itemNamesSizeBytes]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AttributeNameCount: %@,", attributeNameCount]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AttributeNamesSizeBytes: %@,", attributeNamesSizeBytes]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AttributeValueCount: %@,", attributeValueCount]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AttributeValuesSizeBytes: %@,", attributeValuesSizeBytes]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
