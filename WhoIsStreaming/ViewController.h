//
//  ViewController.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/25/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stream.h"

@interface ViewController : UIViewController

// This array will contain the stream objects from the Twitch API.
@property (strong, nonatomic) NSMutableArray* Streams;

@end
