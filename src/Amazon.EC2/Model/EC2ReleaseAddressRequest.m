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

#import "EC2ReleaseAddressRequest.h"


@implementation EC2ReleaseAddressRequest

@synthesize publicIp;
@synthesize allocationId;


- (id)init {
    if (self = [super init]) {
        publicIp = nil;
        allocationId = nil;
    }

    return self;
}

- (id)initWithPublicIp:(NSString *)thePublicIp {
    if (self = [self init]) {
        self.publicIp = thePublicIp;
    }

    return self;
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"PublicIp: %@,", publicIp]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AllocationId: %@,", allocationId]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
