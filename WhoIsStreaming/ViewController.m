//
//  ViewController.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/25/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t imageQueue;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // We want to get the data from the Twitch API here.
    self.streamData = [[StreamManager alloc] init];
    [self.streamData fetchData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // This delegate is required for the UITableView.
    // It returns the number of rows to put in the table.
    
    // Return the number of streams in the stream manager.
    return [[self.streamData streams] count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // This delagate is required for the UITableView.
    // It returns an individual cell for the tableview.
    
    Stream* currentStream = [[self.streamData streams] objectAtIndex:indexPath.row];
    
    UITableViewCell* currentCell = [tableView dequeueReusableCellWithIdentifier:@"StreamCell"];
    
    if (!currentCell) {
        currentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StreamCell"];
    }
    
    currentCell.textLabel.text = [currentStream name];
    
    if (!self.imageQueue) {
        self.imageQueue = dispatch_queue_create("ImageQueue", DISPATCH_QUEUE_SERIAL);
    }
    
    dispatch_async(self.imageQueue, ^{
        NSURL* previewURL = currentStream.previewSmall;
        NSData* imageData = [NSData dataWithContentsOfURL:previewURL];
        UIImage* image = [UIImage imageWithData:imageData];
        
        NSLog(@"Hey HERE!!! -> %@ -> %@", currentStream.name, currentStream);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            currentCell.imageView.image = image;
        });
    });
    
    // Download sample image.
    /*
    NSURL* previewURL = [NSURL URLWithString:@"http://static-cdn.jtvnw.net/previews-ttv/live_user_colbybro-80x50.jpg"];
    NSData* imageData = [NSData dataWithContentsOfURL:previewURL];
    
    UIImage* previewImage = [[UIImage alloc] initWithData:imageData];
    
    currentCell.imageView.image = previewImage;
     */
    
    return currentCell;
}

@end
