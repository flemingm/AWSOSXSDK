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

#import "CloudWatchMetricDatum.h"


@implementation CloudWatchMetricDatum

@synthesize metricName;
@synthesize dimensions;
@synthesize timestamp;
@synthesize value;
@synthesize statisticValues;
@synthesize unit;


- (id)init {
    if (self = [super init]) {
        metricName = nil;
        dimensions = [[NSMutableArray alloc] initWithCapacity:1];
        timestamp = nil;
        value = nil;
        statisticValues = nil;
        unit = nil;
    }

    return self;
}


- (void)addDimension:(CloudWatchDimension *)dimensionObject {
    if (dimensions == nil) {
        dimensions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [dimensions addObject:dimensionObject];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"MetricName: %@,", metricName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Dimensions: %@,", dimensions]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Value: %@,", value]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"StatisticValues: %@,", statisticValues]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Unit: %@,", unit]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
