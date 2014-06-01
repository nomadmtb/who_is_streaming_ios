//
//  StreamTableViewController.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StreamManager.h"
#import "StreamDetailViewController.h"
#import "ModalViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface StreamTableViewController : UITableViewController

@property (strong, nonatomic) StreamManager* streamData;
@property (strong, nonatomic) UIRefreshControl* refreshControl;

@end
