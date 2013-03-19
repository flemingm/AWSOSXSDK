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

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "../AmazonServiceResponse.h"
#import "S3Constants.h"
#import "S3Request.h"


/** response headers that are common to Amazon S3 responses.
 *
 */
@interface S3Response:AmazonServiceResponse {
    int64_t             contentLength;
    NSString            *connectionState;
    NSDate              *date;
    NSString            *etag;
    NSString            *server;
    bool                deleteMarker;
    NSString            *id2;
    NSString            *versionId;
    NSString            *serverSideEncryption;

    NSMutableDictionary *headers;
}

/** Specfies whether the connection to the server is open or closed. */
@property (nonatomic, strong) NSString *connectionState;

/** The entity tag is an MD5 hash of the object that you can use to do conditional
* <code>GET</code> operations using the <code>If-Modified</code> request tag with the <code>GET</code> request operation.
* Amazon S3 checks the object against the provided MD5 value. If they do not match, Amazon S3 returns an error.
* The ETag only reflects changes to the contents of an object, not its metadata.*/
@property (nonatomic, strong) NSString *etag;

/** The name of the server that created the response. */
@property (nonatomic, strong) NSString *server;

/** A special token that helps AWS troubleshoot problems. */
@property (nonatomic, strong) NSString *id2;

/** The version of the object.
 * When you enable versioning, Amazon S3 generates a random number for objects added to a bucket.
 * The value is UTF-8 encoded and URL ready.
 * When you PUT an object in a bucket where versioning has been suspended, the version ID is always <code>null</code>. */
@property (nonatomic, strong) NSString *versionId;

/**
 * Algorithm used for optional server side encryption. */
@property (nonatomic, strong) NSString *serverSideEncryption;

/** The date and time Amazon S3 responded. */
@property (nonatomic, strong) NSDate *date;

/** Specifies whether the object returned was (<code>true</code>) or was not (<code>false</code>) a Delete Marker. */
@property (nonatomic) bool deleteMarker;

/** The length in bytes of the body in the response. */
@property (nonatomic) int64_t contentLength;

/** Sets the value in the response corresponding to the HTTP header */
-(void)setValue:(id)value forHTTPHeaderField:(NSString *)header;

/** Gets the value in the response corresponding to the HTTP header */
-(id)valueForHTTPHeaderField:(NSString *)header;

/** Determines the type of a property in a response. */
-(NSString *)getTypeOfPropertyNamed:(NSString *)propertyName;

@end
