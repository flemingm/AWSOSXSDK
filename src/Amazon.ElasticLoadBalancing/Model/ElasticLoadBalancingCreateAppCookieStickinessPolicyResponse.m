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

#import "ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse.h"


@implementation ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse



-(id)init
{
    if (self = [super init]) {
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"TooManyPolicies"]) {
        newException = [[ElasticLoadBalancingTooManyPoliciesException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"DuplicatePolicyName"]) {
        newException = [[ElasticLoadBalancingDuplicatePolicyNameException alloc] initWithMessage:@""];
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



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}





@end
