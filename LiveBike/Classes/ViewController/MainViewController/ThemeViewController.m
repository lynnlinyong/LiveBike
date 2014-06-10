//
//  ThemeViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-3.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "ThemeViewController.h"

@interface ThemeViewController ()

@end

@implementation ThemeViewController

- (void) loadView
{
    [super loadView];
    self.navigationController.navigationBarHidden = YES;
    [self initUI];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [mtVctr viewDidAppear:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseDirectionNotice:)
                                                 name:@"SwipDirectionNotice"
                                               object:nil];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 
#pragma mark - Custom Action
- (void) initUI
{
    mtVctr  = [[MainThemeViewController alloc]init];
    bfVctr  = [[BerifThemeViewController alloc]init];
    spVctr  = [[SpeedThemeViewController alloc]init];
    
    NSMutableArray *views = [[NSMutableArray alloc]initWithObjects:mtVctr,bfVctr,spVctr, nil];
    self.viewControllers  = views;
}

- (void) responseDirectionNotice:(NSNotification *) notice
{
    NSDictionary *userDic = notice.userInfo;
    NSString *direction   = [userDic objectForKey:@"Direction"];
    NSLog(@"directION:%@", direction);
    UISwipeGestureRecognizer *swipRep = [[UISwipeGestureRecognizer alloc]init];
    if ([direction isEqualToString:@"LeftDirection"])
    {
        swipRep.direction = UISwipeGestureRecognizerDirectionRight;
    }
    else
    {
        NSLog(@"sdijfosidjfsidfjsodifjio");
        swipRep.direction = UISwipeGestureRecognizerDirectionLeft;
    }
    [self changeViewController:swipRep];
}
@end
