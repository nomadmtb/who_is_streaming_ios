//
//  Stream.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/25/14.
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
@property (strong, nonatomic) NSURL* previewSmall;
@property (strong, nonatomic) NSURL* previewMedium;
@property (strong, nonatomic) NSURL* previewLarge;
@property (strong, nonatomic) NSString* status;
@property (strong, nonatomic) NSString* displayName;
@property (strong, nonatomic) NSString* delay;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSNumber* totalViews;
@property (strong, nonatomic) NSNumber* totalFollowers;

@end
