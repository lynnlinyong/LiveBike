//
//  LightSelectViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-2.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "LightSelectViewController.h"

@interface LightSelectViewController ()

@end

@implementation LightSelectViewController

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
    okBtn.hidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    okBtn.hidden = YES;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"灯光方案";
    
    okBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    okBtn.frame = CGRectMake(320-100-10, 10, 100, 30);
    [self.navigationController.navigationBar addSubview:okBtn];
    
    UITableView *funcTab = [[UITableView alloc]init];
    funcTab.delegate   = self;
    funcTab.dataSource = self;
    funcTab.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:funcTab];
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
    return 5;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return 100;
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
                break;
            }
            case 1:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"默认";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 2:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"方案1";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 3:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"方案2";
                nameLab.backgroundColor = [UIColor clearColor];
                nameLab.frame = CGRectMake(10, 12, 100, 20);
                [cell addSubview:nameLab];
                break;
            }
            case 4:
            {
                UILabel *nameLab = [[UILabel alloc]init];
                nameLab.text = @"方案3";
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
