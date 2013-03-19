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




/**
 * Instance Status Event
 */

@interface EC2InstanceStatusEvent : NSObject {
    NSString *code;
    NSString *descriptionValue;
    NSDate *notBefore;
    NSDate *notAfter;
}


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
- (id)init;

/**
 * The associated code of the event. Valid values: instance-reboot,
 * system-reboot, instance-retirement
 */
@property (nonatomic, strong) NSString *code;

/**
 * A description of the event.
 */
@property (nonatomic, strong) NSString *descriptionValue;

/**
 * The earliest scheduled start time for the event.
 */
@property (nonatomic, strong) NSDate *notBefore;

/**
 * The latest scheduled end time for the event.
 */
@property (nonatomic, strong) NSDate *notAfter;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
- (NSString *)description;


@end
