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

#import "ElasticLoadBalancingLoadBalancerDescription.h"


@implementation ElasticLoadBalancingLoadBalancerDescription

@synthesize loadBalancerName;
@synthesize dNSName;
@synthesize canonicalHostedZoneName;
@synthesize canonicalHostedZoneNameID;
@synthesize listenerDescriptions;
@synthesize policies;
@synthesize backendServerDescriptions;
@synthesize availabilityZones;
@synthesize subnets;
@synthesize vPCId;
@synthesize instances;
@synthesize healthCheck;
@synthesize sourceSecurityGroup;
@synthesize securityGroups;
@synthesize createdTime;


- (id)init {
    if (self = [super init]) {
        loadBalancerName = nil;
        dNSName = nil;
        canonicalHostedZoneName = nil;
        canonicalHostedZoneNameID = nil;
        listenerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
        policies = nil;
        backendServerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
        availabilityZones = [[NSMutableArray alloc] initWithCapacity:1];
        subnets = [[NSMutableArray alloc] initWithCapacity:1];
        vPCId = nil;
        instances = [[NSMutableArray alloc] initWithCapacity:1];
        healthCheck = nil;
        sourceSecurityGroup = nil;
        securityGroups = [[NSMutableArray alloc] initWithCapacity:1];
        createdTime = nil;
    }

    return self;
}


- (void)addListenerDescription:(ElasticLoadBalancingListenerDescription *)listenerDescriptionObject {
    if (listenerDescriptions == nil) {
        listenerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [listenerDescriptions addObject:listenerDescriptionObject];
}

- (void)addBackendServerDescription:(ElasticLoadBalancingBackendServerDescription *)backendServerDescriptionObject {
    if (backendServerDescriptions == nil) {
        backendServerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [backendServerDescriptions addObject:backendServerDescriptionObject];
}

- (void)addAvailabilityZone:(NSString *)availabilityZoneObject {
    if (availabilityZones == nil) {
        availabilityZones = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [availabilityZones addObject:availabilityZoneObject];
}

- (void)addSubnet:(NSString *)subnetObject {
    if (subnets == nil) {
        subnets = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [subnets addObject:subnetObject];
}

- (void)addInstance:(ElasticLoadBalancingInstance *)instanceObject {
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instanceObject];
}

- (void)addSecurityGroup:(NSString *)securityGroupObject {
    if (securityGroups == nil) {
        securityGroups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [securityGroups addObject:securityGroupObject];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"DNSName: %@,", dNSName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"CanonicalHostedZoneName: %@,", canonicalHostedZoneName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"CanonicalHostedZoneNameID: %@,", canonicalHostedZoneNameID]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ListenerDescriptions: %@,", listenerDescriptions]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Policies: %@,", policies]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"BackendServerDescriptions: %@,", backendServerDescriptions]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AvailabilityZones: %@,", availabilityZones]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Subnets: %@,", subnets]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"VPCId: %@,", vPCId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Instances: %@,", instances]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"HealthCheck: %@,", healthCheck]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"SourceSecurityGroup: %@,", sourceSecurityGroup]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"SecurityGroups: %@,", securityGroups]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"CreatedTime: %@,", createdTime]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
