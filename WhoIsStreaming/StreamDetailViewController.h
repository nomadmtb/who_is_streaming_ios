//
//  StreamDetailViewController.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "ViewController.h"
#import "Stream.h"

@interface StreamDetailViewController : ViewController

@property (strong, nonatomic) Stream* selectedStream;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewerLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *followerLabel;

@end
