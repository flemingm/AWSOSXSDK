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

#import "CloudWatchGetMetricStatisticsResponse.h"


@implementation CloudWatchGetMetricStatisticsResponse

@synthesize label;
@synthesize datapoints;


- (id)init {
    if (self = [super init]) {
        label = nil;
        datapoints = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"InvalidParameterValue"]) {
        newException = [[CloudWatchInvalidParameterValueException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InternalServiceError"]) {
        newException = [[CloudWatchInternalServiceException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InvalidParameterCombination"]) {
        newException = [[CloudWatchInvalidParameterCombinationException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"MissingParameter"]) {
        newException = [[CloudWatchMissingRequiredParameterException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        exception = newException;
    }
    else {
        exception = theException;
    }
}


- (CloudWatchDatapoint *)datapointsObjectAtIndex:(int)index {
    return (CloudWatchDatapoint *) [datapoints objectAtIndex:index];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Label: %@,", label]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Datapoints: %@,", datapoints]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
