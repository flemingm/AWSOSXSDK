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

#import "S3ListVersionsResult.h"


@implementation S3ListVersionsResult

@synthesize versionSummaries;
@synthesize name;
@synthesize prefix;
@synthesize keyMarker;
@synthesize nextKeyMarker;
@synthesize versionIdMarker;
@synthesize nextVersionIdMarker;
@synthesize delimiter;
@synthesize maxKeys;
@synthesize isTruncated;
@synthesize commonPrefixes;


- (void)setVersionSummaries:(NSMutableArray *)theSummaries {
    versionSummaries = theSummaries;
}

- (NSMutableArray *)versionSummaries {
    if (nil == versionSummaries) {
        versionSummaries = [[NSMutableArray alloc] init];
    }
    return versionSummaries;
}

- (void)setCommonPrefixes:(NSMutableArray *)prefixes {
    commonPrefixes = prefixes;
}

- (NSMutableArray *)commonPrefixes {
    if (nil == commonPrefixes) {
        commonPrefixes = [[NSMutableArray alloc] init];
    }
    return commonPrefixes;
}

- (NSString *)description {
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Summaries: %@,", versionSummaries]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Common Prefixes: %@,", commonPrefixes]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Name: %@,", name]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Prefix: %@,", prefix]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Key Marker: %@,", keyMarker]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Next Key Marker: %@,", nextKeyMarker]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Version Id Marker: %@,", versionIdMarker]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Next Version Id Marker: %@,", nextVersionIdMarker]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Delimiter: %@,", delimiter]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Max Keys: %ld,", (long) maxKeys]];
    [buffer appendString:[[NSString alloc] initWithFormat:@"Is Truncated: %d,", isTruncated]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return buffer;
}

- (void)addDeleteMarker:(S3VersionSummary *)deleteMarker {
    deleteMarker.isDeleteMarker = YES;
    [self.versionSummaries addObject:deleteMarker];
}


@end
