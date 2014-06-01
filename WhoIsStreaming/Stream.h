//
//  Stream.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *  Stream Class
 *  This class will encapsulate the data that belongs to each Stream object.
 */

@interface Stream : NSObject

@property (strong, nonatomic) NSString* game;
@property (strong, nonatomic) NSNumber* viewers;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSNumber* delay;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSNumber* totalViews;
@property (strong, nonatomic) NSNumber* totalFollowers;
@property (strong, nonatomic) NSMutableDictionary* test;


@end
