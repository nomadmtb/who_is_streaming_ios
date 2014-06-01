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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // We only need to have 6 "static" cells at this point.
    
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Stream* currentStream = _selectedStream;
    UITableViewCell* currentCell = nil;
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    switch (indexPath.row) {
        case 0:
            
            NSLog(@"Header detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell" forIndexPath:indexPath];
            currentCell.textLabel.text = [currentStream status];
            break;

        case 1:
            
            NSLog(@"GameCell detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"GameCell" forIndexPath:indexPath];
            currentCell.textLabel.text = @"Game";
            currentCell.detailTextLabel.text = [currentStream game];
            break;
            
        case 2:
            
            NSLog(@"UserCell detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
            currentCell.textLabel.text = @"User";
            currentCell.detailTextLabel.text = [currentStream name];
            break;
            
        case 3:
            
            NSLog(@"ViewersCell detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"ViewersCell" forIndexPath:indexPath];
            currentCell.textLabel.text = @"Viewers";
            currentCell.detailTextLabel.text = [formatter stringFromNumber:[currentStream viewers]];
            
            break;
            
        case 4:
            
            NSLog(@"DelayCell detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"DelayCell" forIndexPath:indexPath];
            currentCell.textLabel.text = @"Delay";
            NSLog(@"%@", currentStream);
            
            // If the delay is 0, then put "Live" in the delay field.
            if ([[currentStream delay] isEqualToNumber:[NSNumber numberWithInt:0]]) {
                currentCell.detailTextLabel.text = @"No delay. Live";
            
            // Else, the delay value will populate the delay field.
            } else {
                currentCell.detailTextLabel.text = [formatter stringFromNumber:[currentStream delay]];
            }
            
            break;
            
        case 5:
            
            NSLog(@"FollowersCell detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"FollowersCell" forIndexPath:indexPath];
            currentCell.textLabel.text = @"Followers";
            currentCell.detailTextLabel.text = [formatter stringFromNumber:[currentStream totalFollowers]];
            break;

        case 6:
            
            NSLog(@"TotalViewsCell detected!");
            currentCell = [tableView dequeueReusableCellWithIdentifier:@"TotalViewsCell" forIndexPath:indexPath];
            currentCell.textLabel.text = @"Total Views";
            currentCell.detailTextLabel.text = [formatter stringFromNumber:[currentStream totalViews]];
            break;
    }
    
    return currentCell;
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
