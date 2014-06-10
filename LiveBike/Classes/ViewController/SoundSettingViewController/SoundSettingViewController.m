//
//  SoundSettingViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SoundSettingViewController.h"

@interface SoundSettingViewController ()

@end

@implementation SoundSettingViewController

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
    self.title = @"语音提示设置";
    
    UITableView *soundTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                        style:UITableViewStyleGrouped];
    soundTab.delegate     = self;
    soundTab.dataSource   = self;
    [self.view addSubview:soundTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 2;
            break;
        }
        case 1:
        {
            return 2;
            break;
        }
        case 2:
        {
            return 2;
            break;
        }
        case 3:
        {
            return 8;
            break;
        }
        case 4:
        {
            return 6;
            break;
        }
        default:
            break;
    }
    
    return 1;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
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
            return @"提示间隔";
            break;
        }
        case 3:
        {
            return @"提示内容";
            break;
        }
        case 4:
        {
            return @"提示内容";
            break;
        }
        default:
            break;
    }
    
    return @"";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    break;
                }
                case 1:
                {
                    LanguageSettingViewController *lVctr = [[LanguageSettingViewController alloc]init];
                    [self.navigationController pushViewController:lVctr animated:YES];
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
                        nameLab.text = @"已被激活";
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
                        nameLab.text = @"语言";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
                        nameLab.text = @"音量";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        break;
                    }
                    case 1:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"暂停播放音乐";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 150, 20);
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
            case 2:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"距离";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        break;
                    }
                    case 1:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"时间";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        break;
                    }
                    default:
                        break;
                }
                break;
            }
            case 3:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"距离";
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
                        nameLab.text = @"时间";
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
                        nameLab.text = @"时长";
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
                        nameLab.text = @"配速";
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
                        nameLab.text = @"速度";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UISwitch *activeSw = [[UISwitch alloc]init];
                        activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                        [cell addSubview:activeSw];
                        break;
                    }
                    case 5:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"心率";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UISwitch *activeSw = [[UISwitch alloc]init];
                        activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                        [cell addSubview:activeSw];
                        break;
                    }
                    case 6:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"踏频";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UISwitch *activeSw = [[UISwitch alloc]init];
                        activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                        [cell addSubview:activeSw];
                        break;
                    }
                    case 7:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"卡路里";
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
            case 4:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"配速";
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
                        nameLab.text = @"速度";
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
                        nameLab.text = @"心率";
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
                        nameLab.text = @"踏频";
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
                        nameLab.text = @"卡路里";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UISwitch *activeSw = [[UISwitch alloc]init];
                        activeSw.frame = CGRectMake(320-100, 7, 100, 20);
                        [cell addSubview:activeSw];
                        break;
                    }
                    case 5:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"缩短";
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
            default:
                break;
        }
    }
    
    return cell;
}
@end
