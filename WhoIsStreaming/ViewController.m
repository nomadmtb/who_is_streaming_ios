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
    
    UITableViewCell* currentCell = [tableView dequeueReusableCellWithIdentifier:@"StreamCell"];
    
    if (!currentCell) {
        currentCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StreamCell"];
    }
    
    currentCell.textLabel.text = [[[self.streamData streams] objectAtIndex:indexPath.row] name];
    
    return currentCell;
}

@end
