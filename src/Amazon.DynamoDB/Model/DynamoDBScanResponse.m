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

#import "DynamoDBScanResponse.h"


@implementation DynamoDBScanResponse

@synthesize items;
@synthesize count;
@synthesize scannedCount;
@synthesize lastEvaluatedKey;
@synthesize consumedCapacityUnits;


- (id)init {
    if (self = [super init]) {
        items = [[NSMutableArray alloc] initWithCapacity:1];
        count = nil;
        scannedCount = nil;
        lastEvaluatedKey = nil;
        consumedCapacityUnits = nil;
    }

    return self;
}


- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"ProvisionedThroughputExceededException"]) {
        newException = [[DynamoDBProvisionedThroughputExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InternalServerError"]) {
        newException = [[DynamoDBInternalServerErrorException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"ResourceNotFoundException"]) {
        newException = [[DynamoDBResourceNotFoundException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        exception = newException;
    }
    else {
        exception = theException;
    }
}


- (NSDictionary *)itemsObjectAtIndex:(int)index {
    return (NSDictionary *) items[index];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Items: %@,", items]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Count: %@,", count]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ScannedCount: %@,", scannedCount]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"LastEvaluatedKey: %@,", lastEvaluatedKey]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ConsumedCapacityUnits: %@,", consumedCapacityUnits]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
