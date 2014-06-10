//
//  LightManagerViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "LightManagerViewController.h"

@interface LightManagerViewController ()

@end

@implementation LightManagerViewController
@synthesize viewArray;

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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"灯光设置";
    
    UIButton *mbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mbtn.tag = 0;
    [mbtn setTitle:@"跑马灯" forState:UIControlStateNormal];
    mbtn.frame = CGRectMake(90, 90, 60, 30);
    [mbtn addTarget:self
             action:@selector(doButtonClicked:)
   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mbtn];
    
    UIButton *outBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    outBtn.tag = 1;
    [outBtn setTitle:@"流水灯" forState:UIControlStateNormal];
    outBtn.frame = CGRectMake(170, 90, 60, 30);
    [outBtn addTarget:self
             action:@selector(doButtonClicked:)
   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:outBtn];
    
    viewArray = [[NSMutableArray alloc]init];
    
    MarqueeLightViewController *mqVctr = [[MarqueeLightViewController alloc]init];
    mqVctr.view.frame = CGRectMake(0, 120, 320, self.view.frame.size.height-120-40);
    [viewArray insertObject:mqVctr atIndex:0];
    
    OutLineLightViewController *olVctr = [[OutLineLightViewController alloc]init];
    olVctr.view.frame = CGRectMake(0, 120, 320, self.view.frame.size.height-120-40);
    [viewArray insertObject:olVctr atIndex:1];
    
    [self doButtonClicked:mbtn];
    
    UIButton *defaultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    defaultBtn.tag = 1;
    [defaultBtn setTitle:@"默认" forState:UIControlStateNormal];
    defaultBtn.frame = CGRectMake(0, self.view.frame.size.height-30, 60, 30);
    [defaultBtn addTarget:self
                   action:@selector(doMenuBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:defaultBtn];
    
    UIButton *fun1Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fun1Btn.tag   = 2;
    [fun1Btn setTitle:@"方案1" forState:UIControlStateNormal];
    fun1Btn.frame = CGRectMake(53, self.view.frame.size.height-30, 60, 30);
    [fun1Btn addTarget:self
                   action:@selector(doMenuBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fun1Btn];
    
    UIButton *fun2Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fun2Btn.tag = 3;
    [fun2Btn setTitle:@"方案2" forState:UIControlStateNormal];
    fun2Btn.frame = CGRectMake(106, self.view.frame.size.height-30, 60, 30);
    [fun2Btn addTarget:self
                   action:@selector(doMenuBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fun2Btn];
    
    UIButton *fun3Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fun3Btn.tag = 4;
    [fun3Btn setTitle:@"方案3" forState:UIControlStateNormal];
    fun3Btn.frame = CGRectMake(159, self.view.frame.size.height-30, 60, 30);
    [fun3Btn addTarget:self
                   action:@selector(doMenuBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fun3Btn];
    
    UIButton *fun4Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fun4Btn.tag = 5;
    [fun4Btn setTitle:@"方案4" forState:UIControlStateNormal];
    fun4Btn.frame = CGRectMake(212, self.view.frame.size.height-30, 60, 30);
    [fun4Btn addTarget:self
                   action:@selector(doMenuBtnClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fun4Btn];
    
    UIButton *fun5Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fun5Btn.tag = 5;
    [fun5Btn setTitle:@"自定义" forState:UIControlStateNormal];
    fun5Btn.frame = CGRectMake(265, self.view.frame.size.height-30, 60, 30);
    [fun5Btn addTarget:self
                action:@selector(doMenuBtnClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fun5Btn];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doMenuBtnClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        case 3:
        {
            break;
        }
        case 4:
        {
            break;
        }
        case 5:
        {
            break;
        }
        default:
            break;
    }
}

- (void) doButtonClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 0:
        {
            UIViewController *mqVctr = [viewArray objectAtIndex:0];
            UIViewController *olVctr = [viewArray objectAtIndex:1];
            if ([mqVctr.view isDescendantOfView:self.view])
                [self.view bringSubviewToFront:mqVctr.view];
            else
                [self.view addSubview:mqVctr.view];
            
            [olVctr.view removeFromSuperview];
            break;
        }
        case 1:
        {
            UIViewController *mqVctr = [viewArray objectAtIndex:0];
            UIViewController *olVctr = [viewArray objectAtIndex:1];
            if ([olVctr.view isDescendantOfView:self.view])
                [self.view bringSubviewToFront:olVctr.view];
            else
                [self.view addSubview:olVctr.view];
            [mqVctr.view removeFromSuperview];
            break;
        }
        default:
            break;
    }
}
@end
