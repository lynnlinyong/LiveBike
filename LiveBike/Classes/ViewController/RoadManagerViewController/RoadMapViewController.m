//
//  RoadMapViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "RoadMapViewController.h"

@interface RoadMapViewController ()

@end

@implementation RoadMapViewController

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
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.tag = 0;
    [backBtn setImage:[UIImage imageNamed:@"backIcon.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 10, 60, 60);
    [self.view addSubview:backBtn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 1;
    [btn1 setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(54, 10, 60, 60);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 2;
    [btn2 setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(108, 10, 60, 60);
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.tag = 3;
    [btn3 setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn3.frame = CGRectMake(162, 10, 60, 60);
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.tag = 4;
    [btn4 setImage:[UIImage imageNamed:@"4.png"]
          forState:UIControlStateNormal];
    [btn4 addTarget:self
             action:@selector(doButtonClicked:)
   forControlEvents:UIControlEventTouchUpInside];
    btn4.frame = CGRectMake(216, 10, 60, 60);
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.tag = 5;
    [btn5 setImage:[UIImage imageNamed:@"5.png"]
          forState:UIControlStateNormal];
    [btn5 addTarget:self
             action:@selector(doButtonClicked:)
   forControlEvents:UIControlEventTouchUpInside];
    btn5.frame = CGRectMake(270, 10, 60, 60);
    [self.view addSubview:btn5];
    
    GMSMapView *mapView_ = [GMSMapView mapWithFrame:CGRectMake(0, 50,
                                                               self.view.frame.size.width, self.view.frame.size.height-50)
                                 camera:nil];
    mapView_.settings.compassButton    = YES;
    mapView_.settings.myLocationButton = NO;
    [self.view addSubview:mapView_];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 0:
        {
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
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
            AddRoadViewController *roadMapVctr = [[AddRoadViewController alloc]init];
            [self.navigationController pushViewController:roadMapVctr animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
