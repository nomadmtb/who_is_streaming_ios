//
//  StreamManager.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/26/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stream.h"

@interface StreamManager : NSObject

@property (strong, nonatomic) NSMutableArray* streams;

-(void) fetchData;

@end
