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
 * Provisioned Throughput Description
 */

@interface DynamoDBProvisionedThroughputDescription:NSObject

{
    NSDate   *lastIncreaseDateTime;
    NSDate   *lastDecreaseDateTime;
    NSNumber *numberOfDecreasesToday;
    NSNumber *readCapacityUnits;
    NSNumber *writeCapacityUnits;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the LastIncreaseDateTime property for this object.
 */
@property (nonatomic, strong) NSDate *lastIncreaseDateTime;

/**
 * The value of the LastDecreaseDateTime property for this object.
 */
@property (nonatomic, strong) NSDate *lastDecreaseDateTime;

/**
 * The value of the NumberOfDecreasesToday property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, strong) NSNumber *numberOfDecreasesToday;

/**
 * The value of the ReadCapacityUnits property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, strong) NSNumber *readCapacityUnits;

/**
 * The value of the WriteCapacityUnits property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, strong) NSNumber *writeCapacityUnits;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
