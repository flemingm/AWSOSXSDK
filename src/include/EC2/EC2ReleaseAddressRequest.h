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


#import "../AmazonServiceRequestConfig.h"


/**
 * Release Address Request
 */

@interface EC2ReleaseAddressRequest : AmazonServiceRequestConfig {
    NSString *publicIp;
    NSString *allocationId;
}


/**
 * The elastic IP address that you are releasing from your account.
 */
@property (nonatomic, strong) NSString *publicIp;

/**
 * The allocation ID that AWS provided when you allocated the address for
 * use with Amazon VPC.
 */
@property (nonatomic, strong) NSString *allocationId;


/**
 * Default constructor for a new ReleaseAddressRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
- (id)init;

/**
 * Constructs a new ReleaseAddressRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param thePublicIp The elastic IP address that you are releasing from
 * your account.
 */
- (id)initWithPublicIp:(NSString *)thePublicIp;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
- (NSString *)description;


@end
