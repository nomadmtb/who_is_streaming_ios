//
//  StreamDetailViewController.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "StreamDetailViewController.h"

@interface StreamDetailViewController ()

@property (nonatomic, strong) dispatch_queue_t videoQueue;

@end

@implementation StreamDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_navigationTitle setTitle:[_selectedStream name]];
    
    // Load labels.
    [_userLabel setText:[_selectedStream name]];
    [_gameLabel setText:[_selectedStream game]];
    [_viewerLabel setText:[[_selectedStream viewers] stringValue]];
    [_followerLabel setText:[[_selectedStream totalFollowers] stringValue]];
    [_totalViewLabel setText:[[_selectedStream totalViews] stringValue]];
    
    // Fetch the video stream into the webview.
    if (!_videoQueue) _videoQueue = dispatch_queue_create("VideoQueue", nil);
    
    dispatch_async(_videoQueue, ^{
        NSURLRequest* videoRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.twitch.tv/%@/popout", self.selectedStream.name]]];
        
        NSLog(@"Loading Video Frame");
        [_webView setAllowsInlineMediaPlayback:YES];
        [[_webView scrollView] setScrollEnabled:NO];
        [_webView loadRequest:videoRequest];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"Webview Complete!");
        });
        
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
