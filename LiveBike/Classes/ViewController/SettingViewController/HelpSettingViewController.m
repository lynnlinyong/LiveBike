//
//  HelpSettingViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "HelpSettingViewController.h"

@interface HelpSettingViewController ()

@end

@implementation HelpSettingViewController

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
    self.title = @"紧急救援";
    
    UITableView *helpTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       style:UITableViewStyleGrouped];
    helpTab.delegate     = self;
    helpTab.dataSource   = self;
    [self.view addSubview:helpTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return @"";
            break;
        }
        case 1:
        {
            return @"遇到紧急情况联系人";
            break;
        }
        default:
            break;
    }
    
    return @"";
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 1;
            break;
        }
        case 1:
        {
            return 4;
            break;
        }
        default:
            break;
    }
    
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        switch (indexPath.section)
        {
            case 0:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"激活";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UISwitch *activeSw = [[UISwitch alloc]init];
                        activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                        [cell addSubview:activeSw];
                        break;
                    }
                    default:
                        break;
                }
                break;
            }
            case 1:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"联系人";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UISwitch *activeSw = [[UISwitch alloc]init];
                        activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                        [cell addSubview:activeSw];
                        break;
                    }
                    case 1:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"张三";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        break;
                    }
                    case 2:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"李四";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        break;
                    }
                    case 3:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"张三";
                        nameLab.textAlignment   = NSTextAlignmentCenter;
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(0, 0, 320, 44);
                        [cell addSubview:nameLab];
                        break;
                    }
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }
    }
    
    return cell;
}
@end
