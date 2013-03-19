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

#import "DynamoDBAttributeValue.h"

#import "DynamoDBResponse.h"

#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"
#import "DynamoDBResourceNotFoundException.h"


/**
 * Get Item Result
 */

@interface DynamoDBGetItemResponse:DynamoDBResponse

{
    NSMutableDictionary *item;
    NSNumber            *consumedCapacityUnits;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Contains the requested attributes.
 */
@property (nonatomic, strong) NSMutableDictionary *item;

/**
 * The number of Capacity Units of the provisioned throughput of the
 * table consumed during the operation. <code>GetItem</code>,
 * <code>BatchGetItem</code>, <code>BatchWriteItem</code>,
 * <code>Query</code>, and <code>Scan</code> operations consume
 * <code>ReadCapacityUnits</code>, while <code>PutItem</code>,
 * <code>UpdateItem</code>, and <code>DeleteItem</code> operations
 * consume <code>WriteCapacityUnits</code>.
 */
@property (nonatomic, strong) NSNumber *consumedCapacityUnits;

/**
 * Returns a value from the item dictionary for the specified key.
 */
-(DynamoDBAttributeValue *)itemValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
