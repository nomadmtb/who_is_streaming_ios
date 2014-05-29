//
//  ViewController.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/25/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StreamManager.h"
#import "Stream.h"
#import "StreamDetailViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

// This array will contain the stream objects from the Twitch API.
@property (strong, nonatomic) StreamManager* streamData;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
