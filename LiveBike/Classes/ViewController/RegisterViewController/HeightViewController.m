//
//  HeightViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-19.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "HeightViewController.h"

@interface HeightViewController ()

@end

@implementation HeightViewController

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
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doGetCurrentValueNotice:)
                                                 name:@"CurrentValue"
                                               object:nil];
    
    [self initUI];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    curHeightLab = [[UILabel alloc]init];
    curHeightLab.textAlignment   = NSTextAlignmentCenter;
    curHeightLab.backgroundColor = [UIColor clearColor];
    curHeightLab.frame = CGRectMake(30, 214, 100, 20);
    [self.view addSubview:curHeightLab];
    
    NumberRule *numberRule = [[NumberRule alloc]initWithFrame:CGRectMake(320-75-30, 164, 75, 280)
                                                withType:kHeightType];
    numberRule.startNumber = 2.30;
    numberRule.endNumber   = 0.60;
    numberRule.dValue      = 0.05;
    [numberRule initUI];
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
        self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:numberRule];
    
    UIView *spliteView = [[UIView alloc]init];
    spliteView.frame = CGRectMake(numberRule.frame.origin.x+numberRule.frame.size.width/3, numberRule.frame.origin.y+numberRule.frame.size.height/2, 2*numberRule.frame.size.width/3, 1);
    spliteView.backgroundColor = [UIColor redColor];
    [self.view addSubview:spliteView];
    
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
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
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
        case 2:   //下一步
        {
            BirthYearViewController *bVctr = [[BirthYearViewController alloc]init];
            [self.navigationController pushViewController:bVctr animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark -
#pragma mark - Notice Action
- (void)doGetCurrentValueNotice:(NSNotification *) notice
{
    DebugLog(@"notice:%@", notice);
    NSNumber *heightValue = [notice.userInfo objectForKey:@"currentValue"];
    curHeightLab.text = [NSString stringWithFormat:@"%.2f M", heightValue.floatValue];
}
@end
