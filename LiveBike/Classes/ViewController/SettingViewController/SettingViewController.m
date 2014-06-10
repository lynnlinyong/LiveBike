//
//  SettingViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    self.title =  @"设置";

    UITableView *setTab = [[UITableView alloc]init];
    setTab.delegate = self;
    setTab.dataSource = self;
    setTab.frame    = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:setTab];
}

#pragma mark - 
#pragma mark - Custom Action
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
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
                nameLab.text = @"JEEP";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(20, 12, 100, 20);
                [cell addSubview:nameLab];
                
                UIButton *userNameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [userNameBtn setTitle:@"账号" forState:UIControlStateNormal];
                userNameBtn.frame = CGRectMake(320-60, 0, 40, 30);
                [userNameBtn addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:userNameBtn];
                break;
            }
            case 1:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"绑定新浪微博账号";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 2:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"电话设置";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 3:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"对讲控制";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 4:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"紧急救援";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 5:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"摇杆快捷键设定";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];

                break;
            }
            case 6:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"对对碰";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];

                break;
            }
            case 7:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"刻度单位";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];

                break;
            }
            case 8:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"温度单位";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];

                break;
            }
            case 9:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"环节";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];

                break;
            }
            case 10:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"传感器";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
                [cell addSubview:nameLab];

                break;
            }
            case 11:
            {
                cell.imageView.image = [UIImage imageNamed:@"menu.png"];
                
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"邀请好友";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(80, 12, 200, 20);
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
            break;
        }
        case 4:
        {
            HelpSettingViewController *hpVctr = [[HelpSettingViewController alloc]init];
            [self.navigationController pushViewController:hpVctr animated:YES];
            break;
        }
        case 5:
        {
            HotKeySettingViewController *hsVctr = [[HotKeySettingViewController alloc]init];
            [self.navigationController pushViewController:hsVctr animated:YES];
            break;
        }
        case 6:
        {
            TwoOfKindViewController *tkVctr = [[TwoOfKindViewController alloc]init];
            [self.navigationController pushViewController:tkVctr animated:YES];
            break;
        }
        case 7:
        {
            break;
        }
        default:
            break;
    }
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    AcountViewController *aVctr = [[AcountViewController alloc]init];
    [self.navigationController pushViewController:aVctr animated:YES];
}
@end
