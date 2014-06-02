//
//  StreamTableViewController.m
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/30/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import "StreamTableViewController.h"

@interface StreamTableViewController ()

@property (nonatomic, strong) dispatch_queue_t reloadQueue;

@end

@implementation StreamTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshStreams) forControlEvents:UIControlEventValueChanged];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refresh Streams"];
    
    
    // Init our streamManager that will fetch our Twitch Data.
    if (!_streamData) _streamData = [[StreamManager alloc] init];
    [_streamData fetchData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

-(BOOL) shouldAutorotate {
    return YES;
}

// Root Navigation controller will call this to delegate this method to each view controller.
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void) refreshStreams {
    
    NSLog(@"Refreshing Streams!!!");
    
    if (!_reloadQueue) _reloadQueue = dispatch_queue_create("reloadQueue", nil);
    
    // Reload data in a seperate thread.
    dispatch_async(_reloadQueue, ^{
        [_streamData reloadData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        });
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [[_streamData streams] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    Stream* currentStream = [[_streamData streams] objectAtIndex:indexPath.row];
    
    UITableViewCell* currentCell = [tableView dequeueReusableCellWithIdentifier:@"StreamCell" forIndexPath:indexPath];
    
    currentCell.textLabel.text = (currentStream.name) ? [currentStream name] : @"- No name -";
    currentCell.detailTextLabel.text = (currentStream.game) ? [currentStream game] : @"- No game -";
    
    return currentCell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"ShowStreamDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        StreamDetailViewController* destinationController = segue.destinationViewController;
        destinationController.selectedStream = [[self.streamData streams] objectAtIndex:indexPath.row];
    }
    
    if ([segue.identifier isEqualToString:@"ModalInfo"]) {
        
        NSLog(@"Modal Here!");
        ModalViewController* destinationController = segue.destinationViewController;
        
        // We need to take a screenshot of our current view, and apply it as the background.
        UIGraphicsBeginImageContextWithOptions(self.view.window.bounds.size, NO, [UIScreen mainScreen].scale);
        [self.view.window drawViewHierarchyInRect:self.view.window.bounds afterScreenUpdates:YES];
        UIImage* screenshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // Apply image to our viewController instance.
        destinationController.view.backgroundColor = [UIColor colorWithPatternImage:screenshot];
    }
}

@end
