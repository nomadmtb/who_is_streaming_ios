//
//  StreamDetailViewController.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/28/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "StreamDetailViewController.h"

@interface StreamDetailViewController ()

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
    
    self.navigationTitle.title = self.selectedStream.name;
    self.streamTitleLabel.text = self.selectedStream.status;
    self.streamUsernameLabel.text = self.selectedStream.name;
    
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
