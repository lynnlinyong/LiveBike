//
//  WeiboLiveViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "WeiboLiveViewController.h"

@interface WeiboLiveViewController ()

@end

@implementation WeiboLiveViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, 200, 200);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"设置" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 100, 30);
    [btn addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    
}
@end
