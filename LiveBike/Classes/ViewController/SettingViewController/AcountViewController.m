//
//  AcountViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "AcountViewController.h"

@interface AcountViewController ()

@end

@implementation AcountViewController

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
    self.title = @"账号";
    
    UITableView *acountTab = [[UITableView alloc]init];
    acountTab.delegate     = self;
    acountTab.dataSource   = self;
    acountTab.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:acountTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
                nameLab.text = @"昵称";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 1:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"修改密码";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 2:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"性别";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 3:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"身高";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 4:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"体重";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 5:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"出生年月";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 6:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"活动强度";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 200, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 7:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"注销";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.textAlignment = NSTextAlignmentCenter;
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
            break;
        }
        case 4:
        {
            break;
        }
        case 5:
        {
            break;
        }
        case 6:
        {
            break;
        }
        case 7:
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        }
        default:
            break;
    }
}
@end
