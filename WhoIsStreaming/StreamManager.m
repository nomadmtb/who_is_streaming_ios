//
//  StreamManager.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "StreamManager.h"

@implementation StreamManager

-(void) fetchData {
    
    NSLog(@"Fetching Data From Twitch API.");
    
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
                                                            message:@"Error when parsing JSON"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            
        }else{
            
            // Parsing successful! Move along.
            if (!_streams) {
                _streams = [[NSMutableArray alloc] init];
            }
            
            NSArray* streams = jsonData [@"streams"];
            
            // Iterate through array of streams, and create Stream objects.
            for (int i=0; i < [streams count]; i++) {
                
                Stream* newStream = [[Stream alloc] init];
                
                newStream.game = streams[i] [@"channel"] [@"game"];
                newStream.viewers = streams[i] [@"viewers"];
                newStream.status = streams[i] [@"channel"] [@"status"];
                newStream.delay = streams[i] [@"channel"] [@"delay"];
                newStream.name = streams[i] [@"channel"] [@"name"];
                newStream.totalViews = streams[i] [@"channel"] [@"views"];
                newStream.totalFollowers = streams[i] [@"channel"] [@"followers"];
                
                if (newStream.game == (id)[NSNull null]) newStream.game = nil;
                if (newStream.viewers == (id)[NSNull null]) newStream.viewers = 0;
                if (newStream.status == (id)[NSNull null]) newStream.status = nil;
                if (newStream.delay == (id)[NSNull null]) newStream.game = 0;
                if (newStream.name == (id)[NSNull null]) newStream.game = nil;
                if (newStream.totalViews == (id)[NSNull null]) newStream.totalViews = 0;
                if (newStream.totalFollowers == (id)[NSNull null]) newStream.totalFollowers = 0;
                
                // Add new stream obj to array.
                [_streams addObject:newStream];
            }
        }
    }
}

- (void) reloadData {
    
    NSLog(@"Reloading Data!");
    
    // Set to nil, ARC will clean it up.
    _streams = nil;
    
    // Refetch data.
    [self fetchData];
}


@end
