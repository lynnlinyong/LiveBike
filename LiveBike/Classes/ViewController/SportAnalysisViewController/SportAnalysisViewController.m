//
//  SportAnalysisViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SportAnalysisViewController.h"

@interface SportAnalysisViewController ()

@end

@implementation SportAnalysisViewController

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
    chartBtn.hidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    chartBtn.hidden = YES;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"活动环节";
    
    UIImage *chartImg  = [UIImage imageNamed:@"chart.png"];
    chartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chartBtn setImage:chartImg forState:UIControlStateNormal];
    chartBtn.frame = CGRectMake(320-30, 10, 20, 20);
    [chartBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:chartBtn];
    
    UILabel *distLab = [[UILabel alloc]init];
    distLab.text = @"18英里";
    distLab.font = [UIFont systemFontOfSize:30];
    distLab.backgroundColor = [UIColor clearColor];
    distLab.frame = CGRectMake(40, 80, 120, 40);
    [self.view addSubview:distLab];
    
    UILabel *distInfoLab = [[UILabel alloc]init];
    distInfoLab.text = @"最快分割";
    distInfoLab.textAlignment = NSTextAlignmentCenter;
    distInfoLab.font = [UIFont systemFontOfSize:14];
    distInfoLab.backgroundColor = [UIColor clearColor];
    distInfoLab.frame = CGRectMake(40, 130, 80, 20);
    [self.view addSubview:distInfoLab];
    
    UILabel *distHightLab = [[UILabel alloc]init];
    distHightLab.text = @"23英里";
    distHightLab.font = [UIFont systemFontOfSize:30];
    distHightLab.backgroundColor = [UIColor clearColor];
    distHightLab.frame = CGRectMake(160, 80, 120, 40);
    [self.view addSubview:distHightLab];
    
    UILabel *distHightInfoLab = [[UILabel alloc]init];
    distHightInfoLab.text = @"最高海拔";
    distHightInfoLab.textAlignment = NSTextAlignmentCenter;
    distHightInfoLab.font = [UIFont systemFontOfSize:14];
    distHightInfoLab.backgroundColor = [UIColor clearColor];
    distHightInfoLab.frame = CGRectMake(160, 130, 80, 20);
    [self.view addSubview:distHightInfoLab];
    
    UIButton *search1Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [search1Btn setTitle:@"1英里" forState:UIControlStateNormal];
    search1Btn.frame = CGRectMake(0, 160, 80, 20);
    [search1Btn addTarget:self
                   action:@selector(doButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:search1Btn];
    
    UIButton *search2Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [search2Btn setTitle:@"2英里" forState:UIControlStateNormal];
    search2Btn.frame = CGRectMake(80, 160, 80, 20);
    [search2Btn addTarget:self
                   action:@selector(doButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:search2Btn];
    
    UIButton *search3Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [search3Btn setTitle:@"5英里" forState:UIControlStateNormal];
    search3Btn.frame = CGRectMake(160, 160, 80, 20);
    [search3Btn addTarget:self
                   action:@selector(doButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:search3Btn];
    
    UIButton *search4Btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [search4Btn setTitle:@"10英里" forState:UIControlStateNormal];
    search4Btn.frame = CGRectMake(240, 160, 80, 20);
    [search4Btn addTarget:self
                   action:@selector(doButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:search4Btn];
    
    UIGridView *gdView = [[UIGridView alloc]init];
    if ([gdView respondsToSelector:@selector(setSeparatorInset:)]) {
        [gdView setSeparatorInset:UIEdgeInsetsZero];
    }
    gdView.scrollEnabled = NO;
    gdView.uiGridViewDelegate = self;
    gdView.frame = CGRectMake(0, 200, 320, 210);
    [self.view addSubview:gdView];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    
}

#pragma mark -
#pragma mark - UIGridViewDelegate
- (void) gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
    
}

- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
    return 60;
}

- (CGFloat) gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
    return 20;
}

- (NSInteger) numberOfColumnsOfGridView:(UIGridView *) grid
{
    return 5;
}

- (NSInteger) numberOfCellsOfGridView:(UIGridView *) grid
{
    return 20;
}

- (UIGridViewCell *) gridView:(UIGridView *)grid cellForRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
    UIGridViewCell *cell = [[UIGridViewCell alloc]init];
    switch (rowIndex)
    {
        case 0:
        {
            switch (columnIndex)
            {
                case 0:
                {
                    UILabel *infoLab = [[UILabel alloc]init];
                    infoLab.text = @"英里";
                    infoLab.font = [UIFont systemFontOfSize:14.f];
                    infoLab.frame= CGRectMake(0, 0, 72, 20);
                    infoLab.textAlignment = NSTextAlignmentCenter;
                    infoLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:infoLab];
                    break;
                }
                case 1:
                {
                    UILabel *infoLab = [[UILabel alloc]init];
                    infoLab.text = @"英里时";
                    infoLab.font = [UIFont systemFontOfSize:14.f];
                    infoLab.frame= CGRectMake(0, 0, 72, 20);
                    infoLab.textAlignment = NSTextAlignmentCenter;
                    infoLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:infoLab];
                    break;
                }
                case 2:
                {
                    UILabel *infoLab = [[UILabel alloc]init];
                    infoLab.text = @"英尺";
                    infoLab.frame= CGRectMake(0, 0, 72, 20);
                    infoLab.font = [UIFont systemFontOfSize:14.f];
                    infoLab.textAlignment   = NSTextAlignmentCenter;
                    infoLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:infoLab];
                    break;
                }
                case 3:
                {
                    UILabel *infoLab = [[UILabel alloc]init];
                    infoLab.text = @"转/分";
                    infoLab.frame= CGRectMake(0, 0, 72, 20);
                    infoLab.font = [UIFont systemFontOfSize:14.f];
                    infoLab.textAlignment   = NSTextAlignmentCenter;
                    infoLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:infoLab];
                    break;
                }
                case 4:
                {
                    UILabel *infoLab = [[UILabel alloc]init];
                    infoLab.text = @"bpm";
                    infoLab.frame= CGRectMake(0, 0, 72, 20);
                    infoLab.font = [UIFont systemFontOfSize:14.f];
                    infoLab.textAlignment = NSTextAlignmentCenter;
                    infoLab.backgroundColor = [UIColor clearColor];
                    [cell addSubview:infoLab];
                    break;
                }
                default:
                    break;
            }
        }
    }
    return cell;
}
@end
