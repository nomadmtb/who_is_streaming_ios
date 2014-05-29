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
    
    
    /*
     * We will handle this later.
     
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
     */
    
    return currentCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowStreamDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        StreamDetailViewController* destinationController = segue.destinationViewController;
        destinationController.selectedStream = [[self.streamData streams] objectAtIndex:indexPath.row];
    }
}

@end
