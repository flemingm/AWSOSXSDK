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

#import "DynamoDBPutRequestUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBAttributeValueUnmarshaller.h"
#import "DynamoDBAttributeValueUnmarshaller.h"


@implementation DynamoDBPutRequestUnmarshaller


+ (DynamoDBPutRequest *)unmarshall:(NSDictionary *)jsonObject {
    DynamoDBPutRequest *putRequest = [[DynamoDBPutRequest alloc] init];


    NSDictionary *itemObject = [jsonObject valueForKey:@"Item"];
    for (NSString *key in [itemObject allKeys]) {
        NSDictionary *value = [itemObject valueForKey:key];
        [putRequest.item setValue:[DynamoDBAttributeValueUnmarshaller unmarshall:value] forKey:key];
    }

    return putRequest;
}

@end
