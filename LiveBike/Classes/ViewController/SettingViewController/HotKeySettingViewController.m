//
//  HotKeySettingViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "HotKeySettingViewController.h"

@interface HotKeySettingViewController ()

@end

@implementation HotKeySettingViewController

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
    self.title = @"摇杆快捷键设定";
    
    UITableView *hotKeyTab = [[UITableView alloc]init];
    hotKeyTab.delegate     = self;
    hotKeyTab.dataSource   = self;
    hotKeyTab.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:hotKeyTab];
}

- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
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
                nameLab.text = @"前摇杆双击";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 1:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"后摇杆双击";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 2:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"前摇杆长按";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 3:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"后摇杆长按";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 4:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F1";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 5:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F2";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 6:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F3";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 7:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F4";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 8:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F5";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 9:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F6";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 10:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F7";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            }
            case 11:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"F8";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
}
@end
