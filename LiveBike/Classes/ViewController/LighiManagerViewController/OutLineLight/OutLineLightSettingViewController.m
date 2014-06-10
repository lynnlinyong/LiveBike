//
//  OutLineLightSettingViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "OutLineLightSettingViewController.h"

@interface OutLineLightSettingViewController ()

@end

@implementation OutLineLightSettingViewController

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
    self.title = @"灯光管理";
    
    UITableView *lightTab = [[UITableView alloc]init];
    lightTab.delegate     = self;
    lightTab.dataSource   = self;
    lightTab.frame        = CGRectMake(0, 70,
                                       self.view.frame.size.width, self.view.frame.size.height-70);
    [self.view addSubview:lightTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableVIewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
            return @"灯光颜色";
            break;
        }
        case 2:
        {
            return @"灯光强度";
            break;
        }
        case 3:
        {
            return @"时间间隔";
            break;
        }
        default:
            break;
    }
    
    return @"";
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString    = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        switch (indexPath.section)
        {
            case 0:
            {
                break;
            }
            case 1:
            {
                UIButton *colorBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
                [colorBtn1 setImage:[UIImage imageNamed:@"color.png"] forState:UIControlStateNormal];
                colorBtn1.frame = CGRectMake(20, 10, 20, 20);
                [cell addSubview:colorBtn1];
                
                UIButton *colorBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
                [colorBtn2 setImage:[UIImage imageNamed:@"color.png"] forState:UIControlStateNormal];
                colorBtn2.frame = CGRectMake(50, 10, 20, 20);
                [cell addSubview:colorBtn2];
                
                UIButton *colorBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
                [colorBtn3 setImage:[UIImage imageNamed:@"color.png"] forState:UIControlStateNormal];
                colorBtn3.frame = CGRectMake(80, 10, 20, 20);
                [cell addSubview:colorBtn3];
                
                UIButton *colorBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
                [colorBtn4 setImage:[UIImage imageNamed:@"color.png"] forState:UIControlStateNormal];
                colorBtn4.frame = CGRectMake(110, 10, 20, 20);
                [cell addSubview:colorBtn4];
                break;
            }
            case 2:
            {
                UIProgressView *pgView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 20, 280, 20)];
                [pgView setProgressViewStyle:UIProgressViewStyleDefault];
                pgView.progress = 0.5;
                [cell addSubview:pgView];
                break;
            }
            case 3:
            {
                switch (indexPath.row)
                {
                    case 0:
                    {
                        UIProgressView *pgView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 20, 280, 20)];
                        [pgView setProgressViewStyle:UIProgressViewStyleDefault];
                        pgView.progress = 0.5;
                        [cell addSubview:pgView];
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
