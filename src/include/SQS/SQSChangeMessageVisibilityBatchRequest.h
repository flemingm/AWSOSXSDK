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

#import "SQSChangeMessageVisibilityBatchRequestEntry.h"

#import "../AmazonServiceRequestConfig.h"


/**
 * Change Message Visibility Batch Request
 */

@interface SQSChangeMessageVisibilityBatchRequest : AmazonServiceRequestConfig {
    NSString *queueUrl;
    NSMutableArray *entries;
}


/**
 * The URL of the SQS queue to take action on.
 */
@property (nonatomic, strong) NSString *queueUrl;

/**
 * A list of receipt handles of the messages for which the visibility
 * timeout must be changed.
 */
@property (nonatomic, strong) NSMutableArray *entries;


/**
 * Default constructor for a new ChangeMessageVisibilityBatchRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
- (id)init;

/**
 * Constructs a new ChangeMessageVisibilityBatchRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theQueueUrl The URL of the SQS queue to take action on.
 * @param theEntries A list of receipt handles of the messages for which
 * the visibility timeout must be changed.
 */
- (id)initWithQueueUrl:(NSString *)theQueueUrl andEntries:(NSMutableArray *)theEntries;

/**
 * Adds a single object to entries.
 * This function will alloc and init entries if not already done.
 */
- (void)addEntry:(SQSChangeMessageVisibilityBatchRequestEntry *)entryObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
- (NSString *)description;


@end
