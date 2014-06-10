//
//  StartMenuViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "StartMenuViewController.h"

@interface StartMenuViewController ()

@end

@implementation StartMenuViewController
@synthesize delegate;

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(20, 130, 280, 147);
    
    UITableView *menuTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 280, 147)];
    if ([menuTab respondsToSelector:@selector(setSeparatorInset:)]) {
        [menuTab setSeparatorInset:UIEdgeInsetsZero];
    }
    menuTab.tag          = 2;
    menuTab.delegate     = self;
    menuTab.dataSource   = self;
    menuTab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:menuTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDatasource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag)
    {
        case 1:
        {
            return 7;
        }
        case 2:
        {
            return 3;
        }
        case 3:
        {
            return 3;
        }
        default:
            break;
    }
    return 1;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    switch (tableView.tag)
    {
        case 1:    //menu
        {
            cell.backgroundColor  = [UIColor clearColor];
            //    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
            switch (indexPath.row)
            {
                case 0:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"灯光管理";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 1:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"路线管理";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 2:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"运动记录";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 3:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"语音提示设置";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 160, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 4:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"系统设置";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 5:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"消息管理";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5,
                                                   100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 6:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    //            UILabel *menuInfoLab = [[UILabel alloc]init];
                    //            menuInfoLab.text  = @"灯光管理";
                    //            menuInfoLab.backgroundColor = [UIColor clearColor];
                    //            menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    //            [cell addSubview:menuInfoLab];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:   //start menu
        {
            switch (indexPath.row)
            {
                case 0:     //随意骑行
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"随意骑行";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 100, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 1:     //选择路线骑行
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"选择路线";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 100, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 2:     //参加活动
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"红树林-深圳湾比赛";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 200, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 3:     //停止活动
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"停止并保存活动进程";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 200, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 1:
                {
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"停止并取消保存活动进程";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 200, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 2:
                {
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"恢复";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 200, 20);
                    [cell addSubview:bikingLab];
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
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:   //随意骑行
        {
            break;
        }
        case 1:   //选择路线骑行
        {
            break;
        }
        case 2:   //参加活动骑行
        {
            break;
        }
        default:
            break;
    }
}
@end
