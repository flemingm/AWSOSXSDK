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
 * Deactivate License Request
 */

@interface EC2DeactivateLicenseRequest : AmazonServiceRequestConfig {
    NSString *licenseId;
    NSNumber *capacity;
}


/**
 * Specifies the ID for the specific license to deactivate against.
 */
@property (nonatomic, strong) NSString *licenseId;

/**
 * Specifies the amount of capacity to deactivate against the license.
 */
@property (nonatomic, strong) NSNumber *capacity;


/**
 * Default constructor for a new DeactivateLicenseRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
- (id)init;

/**
 * Constructs a new DeactivateLicenseRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLicenseId Specifies the ID for the specific license to
 * deactivate against.
 * @param theCapacity Specifies the amount of capacity to deactivate
 * against the license.
 */
- (id)initWithLicenseId:(NSString *)theLicenseId andCapacity:(NSNumber *)theCapacity;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
- (NSString *)description;


@end
