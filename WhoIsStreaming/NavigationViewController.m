//
//  NavigationViewController.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Init extra...
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Customize NavigationBar
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:255/255.0f green:116/255.0f blue:0/255.0f alpha:1.0f]]; /* Orange */
    [self.navigationBar setTintColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f]];  /* White */
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setBarStyle:UIBarStyleBlack];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate {
    
    // Calling this member function from each view controller.
    return [self.visibleViewController shouldAutorotate];
}

- (NSUInteger) supportedInterfaceOrientations {
    NSLog(@"Inside of ROOT orientations.");
    return [self.topViewController supportedInterfaceOrientations];
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
