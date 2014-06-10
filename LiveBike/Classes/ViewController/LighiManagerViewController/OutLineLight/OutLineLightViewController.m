//
//  OutLineLightViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "OutLineLightViewController.h"

@interface OutLineLightViewController ()

@end

@implementation OutLineLightViewController

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
    UIButton *displyLightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [displyLightBtn setImage:[UIImage imageNamed:@"outlineLight.png"]
                    forState:UIControlStateNormal];
    displyLightBtn.frame     = CGRectMake(40, 0, 240, 20);
    [self.view addSubview:displyLightBtn];
    
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
            UIButton *displyLightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [displyLightBtn setImage:[UIImage imageNamed:@"outlineLight.png"]
                            forState:UIControlStateNormal];
            displyLightBtn.frame     = CGRectMake(40, 10, 240, 20);
            [displyLightBtn addTarget:self
                               action:@selector(doLightBtnClicked:)
                     forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:displyLightBtn];
        }
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    rowCount++;
    [lightTab reloadData];
}

- (void) doLightBtnClicked:(id)sender
{
    OutLineLightSettingViewController *olVctr = [[OutLineLightSettingViewController alloc]init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
    [navCtr pushViewController:olVctr animated:YES];
}
@end
