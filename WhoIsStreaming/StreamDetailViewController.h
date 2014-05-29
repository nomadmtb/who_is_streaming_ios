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

@end
