//
//  GroupDetailViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "GroupDetailViewController.h"

@interface GroupDetailViewController ()

@end

@implementation GroupDetailViewController

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
    self.title = @"群组详情";
    
    UITableView *groupTab = [[UITableView alloc]init];
    groupTab.delegate   = self;
    groupTab.dataSource = self;
    groupTab.frame = CGRectMake(0, 150, 320, self.view.frame.size.height-150);
    [self.view addSubview:groupTab];
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

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:idString];
    if (cell)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"群名称";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                UILabel *groupLab = [[UILabel alloc]init];
                groupLab.text  = @"红树林";
                groupLab.frame = CGRectMake(320-120, 12, 100, 20);
                [cell addSubview:groupLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 1:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"清消息通知";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                UISwitch *activeSw = [[UISwitch alloc]init];
                activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                [cell addSubview:activeSw];
                break;
            }
            case 2:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"置顶聊天";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                UISwitch *activeSw = [[UISwitch alloc]init];
                activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                [cell addSubview:activeSw];
                break;
            }
            case 3:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"显示群成员昵称";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                UISwitch *activeSw = [[UISwitch alloc]init];
                activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                [cell addSubview:activeSw];
                break;
            }
            case 4:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"发起活动";
                nameLab.textAlignment   = NSTextAlignmentCenter;
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(0, 12, 320, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 5:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"删除并退出";
                nameLab.textAlignment   = NSTextAlignmentCenter;
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(0, 12, 320, 20);
                [cell addSubview:nameLab];
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
}
@end
