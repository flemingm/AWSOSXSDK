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

#import "SimpleDBSelectResponseUnmarshaller.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

@implementation SimpleDBSelectResponseUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"Item"]) {
        [parser setDelegate:[[SimpleDBItemUnmarshaller alloc] initWithCaller:self withParentObject:self.response.items withSetter:@selector(addObject:)]];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([elementName isEqualToString:@"NextToken"]) {
        self.response.nextToken = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"SelectResult"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(SimpleDBSelectResponse *)response
{
    if (nil == response) {
        response = [[SimpleDBSelectResponse alloc] init];
    }
    return response;
}



@end
