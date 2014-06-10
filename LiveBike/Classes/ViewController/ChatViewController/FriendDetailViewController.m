//
//  FriendDetailViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController ()

@end

@implementation FriendDetailViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    self.title = @"详细资料";
    
    UITableView *detailTab = [[UITableView alloc]init];
    detailTab.delegate   = self;
    detailTab.dataSource = self;
    detailTab.frame = CGRectMake(0, 0, 320, 300);
    [self.view addSubview:detailTab];
    
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendBtn setTitle:@"发送消息" forState:UIControlStateNormal];
    sendBtn.frame = CGRectMake(40, 320, 240, 30);
    [self.view addSubview:sendBtn];
    
    UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [delBtn setTitle:@"删除好友" forState:UIControlStateNormal];
    delBtn.frame = CGRectMake(40, 360, 240, 30);
    [self.view addSubview:delBtn];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 &&indexPath.row == 0)
        return 80;
    
    
    return 44;
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
            return @"";
            break;
        }
        case 1:
        {
            return @"他的路线";
            break;
        }
        default:
            break;
    }
    
    return @"";
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
                        UIImageView *boyImgView = [[UIImageView alloc]init];
                        boyImgView.image = [UIImage imageNamed:@"s_boy.png"];
                        boyImgView.frame = CGRectMake(10, 10, 60, 60);
                        [cell addSubview:boyImgView];
                        
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"波波";
                        nameLab.font = [UIFont systemFontOfSize:20.f];
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(80, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UILabel *acountLab = [[UILabel alloc]init];
                        acountLab.text = @"账号:bobo";
                        acountLab.font = [UIFont systemFontOfSize:12.f];
                        acountLab.backgroundColor = [UIColor clearColor];
                        acountLab.frame = CGRectMake(80, 32, 100, 20);
                        [cell addSubview:acountLab];
                        
                        UILabel *infoLab = [[UILabel alloc]init];
                        infoLab.text = @"备注:张三";
                        infoLab.font = [UIFont systemFontOfSize:12.f];
                        infoLab.backgroundColor = [UIColor clearColor];
                        infoLab.frame = CGRectMake(80, 52, 100, 20);
                        [cell addSubview:infoLab];
                        break;
                    }
                    case 1:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"地区";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        UILabel *distLab = [[UILabel alloc]init];
                        distLab.text = @"广东深圳";
                        distLab.backgroundColor = [UIColor clearColor];
                        distLab.frame = CGRectMake(110, 12, 100, 20);
                        [cell addSubview:distLab];
                        break;
                    }
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
                        nameLab.text = @"红树林";
                        nameLab.backgroundColor = [UIColor clearColor];
                        nameLab.frame = CGRectMake(10, 12, 100, 20);
                        [cell addSubview:nameLab];
                        
                        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                        break;
                    }
                    case 1:
                    {
                        UILabel *nameLab = [[UILabel alloc]init];
                        nameLab.text = @"杨美坑";
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
