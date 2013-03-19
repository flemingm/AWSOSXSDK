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

#import "AutoScalingAutoScalingInstanceDetailsUnmarshaller.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

@implementation AutoScalingAutoScalingInstanceDetailsUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];




    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([elementName isEqualToString:@"InstanceId"]) {
        self.response.instanceId = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"AutoScalingGroupName"]) {
        self.response.autoScalingGroupName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"AvailabilityZone"]) {
        self.response.availabilityZone = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"LifecycleState"]) {
        self.response.lifecycleState = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"HealthStatus"]) {
        self.response.healthStatus = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"LaunchConfigurationName"]) {
        self.response.launchConfigurationName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"AutoScalingInstanceDetails"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(AutoScalingAutoScalingInstanceDetails *)response
{
    if (nil == response) {
        response = [[AutoScalingAutoScalingInstanceDetails alloc] init];
    }
    return response;
}



@end
