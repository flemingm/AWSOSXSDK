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

#import "AutoScalingScheduledUpdateGroupAction.h"


@implementation AutoScalingScheduledUpdateGroupAction

@synthesize autoScalingGroupName;
@synthesize scheduledActionName;
@synthesize scheduledActionARN;
@synthesize time;
@synthesize startTime;
@synthesize endTime;
@synthesize recurrence;
@synthesize minSize;
@synthesize maxSize;
@synthesize desiredCapacity;


- (id)init {
    if (self = [super init]) {
        autoScalingGroupName = nil;
        scheduledActionName = nil;
        scheduledActionARN = nil;
        time = nil;
        startTime = nil;
        endTime = nil;
        recurrence = nil;
        minSize = nil;
        maxSize = nil;
        desiredCapacity = nil;
    }

    return self;
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ScheduledActionName: %@,", scheduledActionName]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ScheduledActionARN: %@,", scheduledActionARN]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Time: %@,", time]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"StartTime: %@,", startTime]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"EndTime: %@,", endTime]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Recurrence: %@,", recurrence]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"MinSize: %@,", minSize]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"MaxSize: %@,", maxSize]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"DesiredCapacity: %@,", desiredCapacity]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
