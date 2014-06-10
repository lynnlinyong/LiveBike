//
//  GroupListViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "GroupListViewController.h"

@interface GroupListViewController ()

@end

@implementation GroupListViewController
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
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    UITableView *chatTab = [[UITableView alloc]init];
    chatTab.delegate     = self;
    chatTab.dataSource   = self;
    chatTab.frame = CGRectMake(0, 0, 320, self.view.frame.size.height-44-64);
    [self.view addSubview:chatTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
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
    NSString *idString    = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        UIImage *headImg  = [UIImage imageNamed:@"s_boy.png"];
        UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [headBtn setImage:headImg forState:UIControlStateNormal];
        [headBtn addTarget:self
                    action:@selector(doButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        headBtn.frame = CGRectMake(0, 2, 40, 40);
        [cell addSubview:headBtn];
        
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.text  = @"罗湖南山";
        nameLab.font  = [UIFont systemFontOfSize:12.f];
        nameLab.backgroundColor = [UIColor clearColor];
        nameLab.frame = CGRectMake(80, 15, 200, 14);
        [cell addSubview:nameLab];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
    GroupDetailViewController *gdVctr = [[GroupDetailViewController alloc]init];
    [navCtr pushViewController:gdVctr animated:YES];
}
@end
