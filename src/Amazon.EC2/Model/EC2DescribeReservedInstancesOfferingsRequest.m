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

#import "EC2DescribeReservedInstancesOfferingsRequest.h"


@implementation EC2DescribeReservedInstancesOfferingsRequest

@synthesize reservedInstancesOfferingIds;
@synthesize instanceType;
@synthesize availabilityZone;
@synthesize productDescription;
@synthesize filters;
@synthesize instanceTenancy;
@synthesize offeringType;
@synthesize nextToken;
@synthesize maxResults;


- (id)init {
    if (self = [super init]) {
        reservedInstancesOfferingIds = [[NSMutableArray alloc] initWithCapacity:1];
        instanceType = nil;
        availabilityZone = nil;
        productDescription = nil;
        filters = [[NSMutableArray alloc] initWithCapacity:1];
        instanceTenancy = nil;
        offeringType = nil;
        nextToken = nil;
        maxResults = nil;
    }

    return self;
}


- (void)addReservedInstancesOfferingId:(NSString *)reservedInstancesOfferingIdObject {
    if (reservedInstancesOfferingIds == nil) {
        reservedInstancesOfferingIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [reservedInstancesOfferingIds addObject:reservedInstancesOfferingIdObject];
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
    [buffer appendString:[[NSString alloc] initWithFormat:@"ReservedInstancesOfferingIds: %@,", reservedInstancesOfferingIds]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ProductDescription: %@,", productDescription]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Filters: %@,", filters]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"InstanceTenancy: %@,", instanceTenancy]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"OfferingType: %@,", offeringType]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"MaxResults: %@,", maxResults]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
