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

#import "EC2CreateInstanceExportTaskRequest.h"


@implementation EC2CreateInstanceExportTaskRequest

@synthesize descriptionValue;
@synthesize instanceId;
@synthesize targetEnvironment;
@synthesize exportToS3Task;


- (id)init {
    if (self = [super init]) {
        descriptionValue = nil;
        instanceId = nil;
        targetEnvironment = nil;
        exportToS3Task = nil;
    }

    return self;
}


- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"TargetEnvironment: %@,", targetEnvironment]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"ExportToS3Task: %@,", exportToS3Task]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}


@end
