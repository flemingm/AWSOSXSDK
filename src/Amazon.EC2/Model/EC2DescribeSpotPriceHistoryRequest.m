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

#import "EC2DescribeSpotPriceHistoryRequest.h"


@implementation EC2DescribeSpotPriceHistoryRequest

@synthesize startTime;
@synthesize endTime;
@synthesize instanceTypes;
@synthesize productDescriptions;
@synthesize filters;
@synthesize availabilityZone;
@synthesize maxResults;
@synthesize nextToken;


- (id)init {
    if (self = [super init]) {
        startTime = nil;
        endTime = nil;
        instanceTypes = [[NSMutableArray alloc] initWithCapacity:1];
        productDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
        filters = [[NSMutableArray alloc] initWithCapacity:1];
        availabilityZone = nil;
        maxResults = nil;
        nextToken = nil;
    }

    return self;
}


- (void)addInstanceType:(NSString *)instanceTypeObject {
    if (instanceTypes == nil) {
        instanceTypes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instanceTypes addObject:instanceTypeObject];
}

- (void)addProductDescription:(NSString *)productDescriptionObject {
    if (productDescriptions == nil) {
        productDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [productDescriptions addObject:productDescriptionObject];
}

- (void)addFilter:(EC2Filter *)filterObject {
    if (filters == nil) {
        filters = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [filters addObject:filterObject];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"StartTime: %@,", startTime]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"EndTime: %@,", endTime]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"InstanceTypes: %@,", instanceTypes]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ProductDescriptions: %@,", productDescriptions]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Filters: %@,", filters]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"MaxResults: %@,", maxResults]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
