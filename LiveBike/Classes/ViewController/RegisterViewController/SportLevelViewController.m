//
//  SportLevelViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SportLevelViewController.h"

@interface SportLevelViewController ()

@end

@implementation SportLevelViewController

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
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text  = @"日常运动强度";
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.textAlignment   = NSTextAlignmentCenter;
    titleLab.frame = CGRectMake(60, 300, 200, 30);
    [self.view addSubview:titleLab];
    
    UILabel *infoLab = [[UILabel alloc]init];
    infoLab.font  = [UIFont systemFontOfSize:12.f];
    infoLab.text  = @"静坐时间较多,阅读、方案工作等";
    infoLab.backgroundColor = [UIColor clearColor];
    infoLab.textAlignment   = NSTextAlignmentCenter;
    infoLab.frame = CGRectMake(20, 330, 280, 14);
    [self.view addSubview:infoLab];
    
    UIButton *lowBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lowBtn setTitle:@"乌龟" forState:UIControlStateNormal];
    lowBtn.frame = CGRectMake(60, 360, 60, 30);
    [self.view addSubview:lowBtn];
    
    UIButton *midBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [midBtn setTitle:@"马" forState:UIControlStateNormal];
    midBtn.frame = CGRectMake(130, 360, 60, 30);
    [self.view addSubview:midBtn];
    
    UIButton *highBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [highBtn setTitle:@"猎豹" forState:UIControlStateNormal];
    highBtn.frame = CGRectMake(200, 360, 60, 30);
    [self.view addSubview:highBtn];
    
    UIButton *preBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    preBtn.tag   = 1;
    preBtn.frame = CGRectMake(50, self.view.frame.size.height-50, 100, 30);
    [preBtn setTitle:@"上一步" forState:UIControlStateNormal];
    [preBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:preBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextBtn.tag   = 2;
    nextBtn.frame = CGRectMake(170, self.view.frame.size.height-50, 100, 30);
    [nextBtn setTitle:@"完成" forState:UIControlStateNormal];
    [nextBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    UIButton *button = sender;
    switch (button.tag)
    {
        case 1:    //上一步
        {
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case 2:   //完成
        {
            LoginViewController *lVctr = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:lVctr
                                                 animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
