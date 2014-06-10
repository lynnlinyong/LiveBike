//
//  WeightViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-19.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "WeightViewController.h"

@interface WeightViewController ()

@end

@implementation WeightViewController

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
    curWeightLab = [[UILabel alloc]init];
    curWeightLab.textAlignment   = NSTextAlignmentCenter;
    curWeightLab.backgroundColor = [UIColor clearColor];
    curWeightLab.frame = CGRectMake(110, 310, 100, 20);
    [self.view addSubview:curWeightLab];
    
    NumberRule *numberRule = [[NumberRule alloc]initWithFrame:CGRectMake(20, 350, 280, 65)
                                                     withType:kWeightType];
    numberRule.startNumber = 25;
    numberRule.endNumber   = 225;
    numberRule.dValue      = 5;
    [numberRule initUI];
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
            self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:numberRule];

    UIView *spliteView = [[UIView alloc]init];
    spliteView.frame = CGRectMake(self.view.frame.size.width/2, numberRule.frame.origin.y, 1, 2*numberRule.frame.size.height/3);
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
            HeightViewController *hVctr = [[HeightViewController alloc]init];
            [self.navigationController pushViewController:hVctr animated:YES];
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
    NSNumber *weightValue = [notice.userInfo objectForKey:@"currentValue"];
    curWeightLab.text = [NSString stringWithFormat:@"%d KG", weightValue.intValue];
}
@end
