//
//  StartActiveViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-2.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "StartActiveViewController.h"

@interface StartActiveViewController ()

@end

@implementation StartActiveViewController

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
    saveBtn.hidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    saveBtn.hidden = YES;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"发起活动";
    
    saveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    saveBtn.frame = CGRectMake(320-100-10, 10, 100, 30);
    [self.navigationController.navigationBar addSubview:saveBtn];
    
    UITableView *activeTab = [[UITableView alloc]init];
    activeTab.delegate     = self;
    activeTab.dataSource   = self;
    activeTab.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    [self.view addSubview:activeTab];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    
}

#pragma mark - 
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4)
    {
        return 70.f;
    }
    
    return 44.f;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"活动名称";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 1:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"活动时间";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 2:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text  = @"线路";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 3:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"灯光方案";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 4:
            {
                break;
            }
            case 5:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"发起活动";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.textAlignment   = NSTextAlignmentCenter;
                nameLab.frame = CGRectMake(0, 12, 320, 20);
                [cell addSubview:nameLab];
                break;
            }
            default:
                break;
        }
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
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
            LightSelectViewController *lsVctr = [[LightSelectViewController alloc]init];
            [self.navigationController pushViewController:lsVctr animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
