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

#import "EC2Vpc.h"


@implementation EC2Vpc

@synthesize vpcId;
@synthesize state;
@synthesize cidrBlock;
@synthesize dhcpOptionsId;
@synthesize tags;
@synthesize instanceTenancy;
@synthesize isDefault;
@synthesize isDefaultIsSet;


- (id)init {
    if (self = [super init]) {
        vpcId = nil;
        state = nil;
        cidrBlock = nil;
        dhcpOptionsId = nil;
        tags = [[NSMutableArray alloc] initWithCapacity:1];
        instanceTenancy = nil;
        isDefault = NO;
        isDefaultIsSet = NO;
    }

    return self;
}


- (void)addTag:(EC2Tag *)tagObject {
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"VpcId: %@,", vpcId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"State: %@,", state]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"CidrBlock: %@,", cidrBlock]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"DhcpOptionsId: %@,", dhcpOptionsId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Tags: %@,", tags]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"InstanceTenancy: %@,", instanceTenancy]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"IsDefault: %d,", isDefault]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


- (void)setIsDefault:(bool)theValue {
    isDefault = theValue;
    isDefaultIsSet = YES;
}


@end
