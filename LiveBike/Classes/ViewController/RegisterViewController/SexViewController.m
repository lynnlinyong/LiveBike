//
//  RegisterViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-19.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SexViewController.h"

@interface SexViewController ()

@end

@implementation SexViewController

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
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //初始化UI
    [self initUI];

}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
    self.title = @"个人资料";
    
    UILabel *infoLab = [[UILabel alloc]init];
    infoLab.backgroundColor = [UIColor clearColor];
    infoLab.text = @"你的资料设定运动目标";
    infoLab.textAlignment = NSTextAlignmentCenter;
    infoLab.frame = CGRectMake(10, 74, 300, 20);
    [self.view addSubview:infoLab];
    
    UIButton *boyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    boyBtn.tag       = 1;
    UIImage *boyImg  = [UIImage imageNamed:@"s_boy"];
    [boyBtn setImage:boyImg forState:UIControlStateNormal];
    boyBtn.frame = CGRectMake(160-boyImg.size.width/2, 150,
                              boyImg.size.width, boyImg.size.height);
    [boyBtn addTarget:self
               action:@selector(doSelectSexClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boyBtn];
    
    UILabel *boyLab = [[UILabel alloc]init];
    boyLab.text  = @"男";
    boyLab.backgroundColor = [UIColor clearColor];
    boyLab.textAlignment   = NSTextAlignmentCenter;
    boyLab.frame = CGRectMake(110, 150+boyImg.size.height+10, 100, 20);
    [self.view addSubview:boyLab];
    
    UIButton *girlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    girlBtn.tag       = 2;
    UIImage *girlImg  = [UIImage imageNamed:@"s_girl"];
    [girlBtn setImage:girlImg forState:UIControlStateNormal];
    girlBtn.frame = CGRectMake(160-girlImg.size.width/2, 150+boyImg.size.height+50,
                               girlImg.size.width, girlImg.size.height);
    [girlBtn addTarget:self
                action:@selector(doSelectSexClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:girlBtn];
    
    UILabel *girlLab = [[UILabel alloc]init];
    girlLab.text  = @"女";
    girlLab.backgroundColor = [UIColor clearColor];
    girlLab.textAlignment   = NSTextAlignmentCenter;
    girlLab.frame = CGRectMake(110, girlBtn.frame.origin.y+girlImg.size.height+10, 100, 20);
    [self.view addSubview:girlLab];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doSelectSexClicked:(id)sender
{
    UIButton *clickBtn = sender;
    switch (clickBtn.tag)
    {
        case 1:   //男
        {
            break;
        }
        case 2:   //女
        {
            break;
        }
        default:
            break;
    }
    
    WeightViewController *wVctr = [[WeightViewController alloc]init];
    [self.navigationController pushViewController:wVctr animated:YES];
}
@end
