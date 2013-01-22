//
//  SynchronizedObject.h
//  Congress
//
//  Created by Daniel Cloud on 1/8/13.
//  Copyright (c) 2013 Sunlight Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SynchronizedObject <NSObject>

@required
+(NSString *)__remoteIdentifierKey;
+(NSMutableDictionary *)collection;

@end


@interface SynchronizedObject : MTLModel <SynchronizedObject>
@property (nonatomic, readonly) NSString *remoteID;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;
@property BOOL persist;

+(instancetype)objectWithExternalRepresentation:(NSDictionary *)externalRepresentation;
+(instancetype)existingObjectWithRemoteID:(NSString *)remoteID;
+(NSMutableDictionary *)collection;
+(NSDictionary *)allObjectsToPersist;
-(void)updateObjectUsingExternalRepresentation:(NSDictionary *)externalRepresentation;
-(void)addObjectToCollection;

@end
