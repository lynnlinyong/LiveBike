//
//  SaveActiveViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SaveActiveViewController.h"

@interface SaveActiveViewController ()

@end

@implementation SaveActiveViewController

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
    self.title = @"附加信息";
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.pagingEnabled = YES;
    scrollView.frame         = CGRectMake(0, 70, 320, 200);
    scrollView.contentSize   = CGSizeMake(7*320, 200);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator   = NO;
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
        self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:scrollView];
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text  = @"感受";
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font  = [UIFont systemFontOfSize:24.f];
    titleLab.frame = CGRectMake(110, 10, 100, 30);
    [scrollView addSubview:titleLab];
    
    UILabel *title1Lab = [[UILabel alloc]init];
    title1Lab.text  = @"路况";
    title1Lab.textAlignment = NSTextAlignmentCenter;
    title1Lab.font  = [UIFont systemFontOfSize:24.f];
    title1Lab.frame = CGRectMake(320+110, 10, 100, 30);
    [scrollView addSubview:title1Lab];
    
    UILabel *title2Lab = [[UILabel alloc]init];
    title2Lab.text  = @"天气";
    title2Lab.textAlignment = NSTextAlignmentCenter;
    title2Lab.font  = [UIFont systemFontOfSize:24.f];
    title2Lab.frame = CGRectMake(320*2+110, 10, 100, 30);
    [scrollView addSubview:title2Lab];
    
    UILabel *title3Lab = [[UILabel alloc]init];
    title3Lab.text  = @"温度";
    title3Lab.textAlignment = NSTextAlignmentCenter;
    title3Lab.font  = [UIFont systemFontOfSize:24.f];
    title3Lab.frame = CGRectMake(320*3+110, 10, 100, 30);
    [scrollView addSubview:title3Lab];
    
    UILabel *title4Lab = [[UILabel alloc]init];
    title4Lab.text  = @"踏频";
    title4Lab.textAlignment = NSTextAlignmentCenter;
    title4Lab.font  = [UIFont systemFontOfSize:24.f];
    title4Lab.frame = CGRectMake(320*4+110, 10, 100, 30);
    [scrollView addSubview:title4Lab];
    
    UILabel *title5Lab = [[UILabel alloc]init];
    title5Lab.text  = @"心率";
    title5Lab.textAlignment = NSTextAlignmentCenter;
    title5Lab.font  = [UIFont systemFontOfSize:24.f];
    title5Lab.frame = CGRectMake(320*5+110, 10, 100, 30);
    [scrollView addSubview:title5Lab];
    
    UILabel *title6Lab = [[UILabel alloc]init];
    title6Lab.text  = @"备注";
    title6Lab.textAlignment = NSTextAlignmentCenter;
    title6Lab.font  = [UIFont systemFontOfSize:24.f];
    title6Lab.frame = CGRectMake(320*6+110, 10, 100, 30);
    [scrollView addSubview:title6Lab];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.tag = 1;
    [nextBtn setImage:[UIImage imageNamed:@"nextBtn.png"] forState:UIControlStateNormal];
    [nextBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    nextBtn.frame = CGRectMake(40, self.view.frame.size.height-80, 40, 40);
    [self.view addSubview:nextBtn];
    
    UIButton *cmpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cmpBtn.tag = 2;
    [cmpBtn setImage:[UIImage imageNamed:@"finishBtn.png"] forState:UIControlStateNormal];
    [cmpBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    cmpBtn.frame = CGRectMake(140, self.view.frame.size.height-80, 40, 40);
    [self.view addSubview:cmpBtn];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.tag = 3;
    [shareBtn setImage:[UIImage imageNamed:@"ShareBtn.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    shareBtn.frame = CGRectMake(220, self.view.frame.size.height-80, 40, 40);
    [self.view addSubview:shareBtn];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
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
        default:
            break;
    }
}

@end
