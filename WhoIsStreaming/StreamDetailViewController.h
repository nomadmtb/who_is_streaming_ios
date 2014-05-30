//
//  StreamDetailViewController.h
//  WhoIsStreaming
//
//  Created by Kyle Luce on 5/28/14.
//  Copyright (c) 2014 Kyle Luce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stream.h"

@interface StreamDetailViewController : UIViewController

@property (nonatomic, weak)Stream* selectedStream;

@property (weak, nonatomic) IBOutlet UILabel* streamTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel* streamUsernameLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem* navigationTitle;
@property (weak, nonatomic) IBOutlet UIImageView *streamPreviewImage;
@property (weak, nonatomic) IBOutlet UILabel *viewerCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalViewerCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followerCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;

@end
