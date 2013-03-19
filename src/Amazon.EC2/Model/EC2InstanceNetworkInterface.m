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

#import "EC2InstanceNetworkInterface.h"


@implementation EC2InstanceNetworkInterface

@synthesize networkInterfaceId;
@synthesize subnetId;
@synthesize vpcId;
@synthesize descriptionValue;
@synthesize ownerId;
@synthesize status;
@synthesize privateIpAddress;
@synthesize privateDnsName;
@synthesize sourceDestCheck;
@synthesize sourceDestCheckIsSet;
@synthesize groups;
@synthesize attachment;
@synthesize association;
@synthesize privateIpAddresses;


- (id)init {
    if (self = [super init]) {
        networkInterfaceId = nil;
        subnetId = nil;
        vpcId = nil;
        descriptionValue = nil;
        ownerId = nil;
        status = nil;
        privateIpAddress = nil;
        privateDnsName = nil;
        sourceDestCheck = NO;
        sourceDestCheckIsSet = NO;
        groups = [[NSMutableArray alloc] initWithCapacity:1];
        attachment = nil;
        association = nil;
        privateIpAddresses = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


- (void)addGroup:(EC2GroupIdentifier *)groupObject {
    if (groups == nil) {
        groups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [groups addObject:groupObject];
}

- (void)addPrivateIpAddresse:(EC2InstancePrivateIpAddress *)privateIpAddresseObject {
    if (privateIpAddresses == nil) {
        privateIpAddresses = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [privateIpAddresses addObject:privateIpAddresseObject];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"NetworkInterfaceId: %@,", networkInterfaceId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"SubnetId: %@,", subnetId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"VpcId: %@,", vpcId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Status: %@,", status]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"PrivateIpAddress: %@,", privateIpAddress]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"PrivateDnsName: %@,", privateDnsName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"SourceDestCheck: %d,", sourceDestCheck]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Groups: %@,", groups]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Attachment: %@,", attachment]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Association: %@,", association]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"PrivateIpAddresses: %@,", privateIpAddresses]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


- (void)setSourceDestCheck:(bool)theValue {
    sourceDestCheck = theValue;
    sourceDestCheckIsSet = YES;
}


@end
