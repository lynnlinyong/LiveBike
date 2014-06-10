//
//  HotKeyFunctionViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "HotKeyFunctionViewController.h"

@interface HotKeyFunctionViewController ()

@end

@implementation HotKeyFunctionViewController

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
    self.title = @"功能列表";
    
    UITableView *hfVctr = [[UITableView alloc]init];
    hfVctr.delegate     = self;
    hfVctr.dataSource   = self;
    hfVctr.frame        = CGRectMake(0, 0, self.view.frame.size.width,
                                     self.view.frame.size.height);
    [self.view addSubview:hfVctr];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
                nameLab.text = @"音乐";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 1:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"会话";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 2:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"设置";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 3:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"报时";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
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
}
@end
