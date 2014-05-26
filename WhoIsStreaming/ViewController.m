//
//  ViewController.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/25/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // We want to get the data from the Twitch API here.
    [self fetchTwitchData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This function will fetch the Twitch data from their API.
- (void) fetchTwitchData {
    
    NSURL* twitchEndpoint = [[NSURL alloc] initWithString:
        @"https://api.twitch.tv/kraken/streams?limit=100"];
    
    NSData* response = [NSData dataWithContentsOfURL:twitchEndpoint];
    
    if (!response) {
        
        NSLog(@"Internet is NOT reachable!");
        
    }else{
        
        NSLog(@"Data -> %@", response);
    }
}

@end
