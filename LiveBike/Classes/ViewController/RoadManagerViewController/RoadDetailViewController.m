//
//  RoadDetailViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "RoadDetailViewController.h"

@interface RoadDetailViewController ()

@end

@implementation RoadDetailViewController

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
    self.title = @"水围-大梅沙";
    
    GMSMapView *mapView_ = [GMSMapView mapWithFrame:CGRectMake(0, 64,
                                                               self.view.frame.size.width, 150)
                                             camera:nil];
    mapView_.settings.compassButton    = YES;
    mapView_.settings.myLocationButton = NO;
    [self.view addSubview:mapView_];
}
@end
