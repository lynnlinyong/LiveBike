//
//  MarqueeLightViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "MarqueeLightViewController.h"

@interface MarqueeLightViewController ()

@end

@implementation MarqueeLightViewController

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
    LightView *lightView = [[LightView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    lightView.lightCount = 8;
    [lightView setupUI];
    [self.view addSubview:lightView];
    
    rowCount = 0;
    
    lightTab = [[UITableView alloc]init];
    lightTab.delegate = self;
    lightTab.dataSource = self;
    lightTab.frame = CGRectMake(0, 30, self.view.frame.size.width,
                                self.view.frame.size.height-30-40-120);
    [self.view addSubview:lightTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rowCount+1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        if (indexPath.row == rowCount)
        {
            UIImage *addImg  = [UIImage imageNamed:@"lightAdd.png"];
            UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [addBtn setImage:addImg forState:UIControlStateNormal];
            addBtn.frame = CGRectMake(20, 10, 30, 30);
            [addBtn addTarget:self
                       action:@selector(doButtonClicked:)
             forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:addBtn];
        }
        else
        {
            LightView *lightView = [[LightView alloc]initWithFrame:CGRectMake(0, 7, 320, 20)];
            lightView.lightCount = 8;
            lightView.isShowNumber = YES;
            lightView.delegate = self;
            [lightView setupUI];
            [cell addSubview:lightView];
        }
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark - LightViewDelegate
- (void) view:(LightView *)view ClickedIndex:(int)index
{
    MarqueeLightSettingViewController *msVctr = [[MarqueeLightSettingViewController alloc]init];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
    [navCtr pushViewController:msVctr animated:YES];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    rowCount++;
    [lightTab reloadData];
}
@end
