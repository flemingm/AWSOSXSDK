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

#import "ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse.h"


@implementation ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse

@synthesize subnets;


- (id)init {
    if (self = [super init]) {
        subnets = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


- (void)setException:(AmazonServiceException *)theException {
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"InvalidSubnet"]) {
        newException = [[ElasticLoadBalancingInvalidSubnetException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"SubnetNotFound"]) {
        newException = [[ElasticLoadBalancingSubnetNotFoundException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"LoadBalancerNotFound"]) {
        newException = [[ElasticLoadBalancingLoadBalancerNotFoundException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InvalidConfigurationRequest"]) {
        newException = [[ElasticLoadBalancingInvalidConfigurationRequestException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        exception = newException;
    }
    else {
        exception = theException;
    }
}


- (NSString *)subnetsObjectAtIndex:(int)index {
    return (NSString *) [subnets objectAtIndex:index];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Subnets: %@,", subnets]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
