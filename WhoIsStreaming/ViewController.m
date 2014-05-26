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
    
    // Check to make sure that data is there...
    for (int i=0; i < [_streams count]; i++) {
        
        NSLog(@"%@", [[_streams objectAtIndex:i] game] );
        
    }
    
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
        
        // Network is not reachable. Log error and alert user.
        
        NSLog(@"Internet is NOT reachable!");
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Network Error"
            message:@"Network is unreachable" delegate:self
            cancelButtonTitle:@"Okay"
            otherButtonTitles:nil, nil];
        
        [alert show];
        
    }else{
        
        // Network WAS reachable. Parse response.
        
        NSError* parseError = nil;
        
        NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:response
            options:0
            error:&parseError];
        
        if (parseError != nil) {
            
            // Error when parsing JSON data.
            
            NSLog(@"Parse Error!");
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"JSON Parse Error!"
                message:@"Error when parsing JSON" delegate:self
                cancelButtonTitle:@"Okay"
                otherButtonTitles:nil, nil];
            
            [alert show];
        
        }else{
            
            // Parsing successful! Move along.
            
            if (!_streams) {
                _streams = [[NSMutableArray alloc] init];
            }
            
            NSArray* streams = jsonData [@"streams"];
            
            NSLog(@"%@", streams);
            
            // Iterate through array of streams, and create Stream objects.
            
            for (int i=0; i < [streams count]; i++) {
                
                Stream* newStream = [[Stream alloc] init];
                
                newStream.game = streams[i] [@"channel"] [@"game"];
                newStream.viewers = streams[i] [@"viewers"];
                newStream.previewSmall = streams[i] [@"preview"] [@"small"];
                newStream.previewMedium = streams[i] [@"preview"] [@"medium"];
                newStream.previewLarge = streams[i] [@"preview"] [@"large"];
                newStream.status = streams[i] [@"channel"] [@"status"];
                newStream.displayName = streams[i] [@"channel"] [@"display_name"];
                newStream.delay = streams[i] [@"channel"] [@"delay"];
                newStream.name = streams[i] [@"channel"] [@"name"];
                newStream.totalViews = streams[i] [@"channel"] [@"views"];
                newStream.totalFollowers = streams[i] [@"channel"] [@"followers"];
                
                // NSLog(@"New Data [%i] -> %@", i, newStream.totalFollowers);
                
                // Add new stream obj to array.
                [_streams addObject:newStream];
                
            }
        }
        
        
    }
}

@end
