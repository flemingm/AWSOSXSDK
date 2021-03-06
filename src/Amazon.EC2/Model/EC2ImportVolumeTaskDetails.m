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

#import "EC2ImportVolumeTaskDetails.h"


@implementation EC2ImportVolumeTaskDetails

@synthesize bytesConverted;
@synthesize availabilityZone;
@synthesize descriptionValue;
@synthesize image;
@synthesize volume;


- (id)init {
    if (self = [super init]) {
        bytesConverted = nil;
        availabilityZone = nil;
        descriptionValue = nil;
        image = nil;
        volume = nil;
    }

    return self;
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"BytesConverted: %@,", bytesConverted]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Image: %@,", image]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Volume: %@,", volume]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
