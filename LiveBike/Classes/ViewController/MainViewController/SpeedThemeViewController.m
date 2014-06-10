//
//  SpeedThemeViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-3.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SpeedThemeViewController.h"

@interface SpeedThemeViewController ()

@end

@implementation SpeedThemeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    CGRect topRect    = CGRectMake(0, 0, 320, self.view.frame.size.height/4);
    CGRect midRect    = CGRectMake(0, 0, 320, self.view.frame.size.height/2);
    CGRect bottomRect = CGRectMake(0, 0, 320, self.view.frame.size.height-80);
    
    ShortCutView *scView = [[ShortCutView alloc]initWithFrame:midRect];
    scView.topFrame    = topRect;
    scView.midFrame    = midRect;
    scView.bottomFrame = bottomRect;
    [self.view addSubview:scView];
}
@end
