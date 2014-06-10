//
//  ChatMainViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "ChatMainViewController.h"

@interface ChatMainViewController ()

@end

@implementation ChatMainViewController

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
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
        nameLab.text  = @"张三";
        nameLab.font  = [UIFont systemFontOfSize:12.f];
        nameLab.backgroundColor = [UIColor clearColor];
        nameLab.frame = CGRectMake(80, 5, 200, 14);
        [cell addSubview:nameLab];
        
        UILabel *msgLab = [[UILabel alloc]init];
        msgLab.text  = @"吃饭没有";
        msgLab.font  = [UIFont systemFontOfSize:12.f];
        msgLab.backgroundColor = [UIColor clearColor];
        msgLab.frame = CGRectMake(80, 20, 200, 14);
        [cell addSubview:msgLab];
        
        UILabel *timeLab = [[UILabel alloc]init];
        timeLab.text = @"14-5-31";
        timeLab.backgroundColor = [UIColor clearColor];
        timeLab.textAlignment = NSTextAlignmentCenter;
        timeLab.frame = CGRectMake(320-110, 10, 100, 20);
        [cell addSubview:timeLab];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AppDelegate *appDelegate  = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *) appDelegate.window.rootViewController;
    
    ChatViewController *cVctr = [[ChatViewController alloc]init];
    [navCtr pushViewController:cVctr animated:YES];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
    FriendDetailViewController *fdVctr = [[FriendDetailViewController alloc]init];
    [navCtr pushViewController:fdVctr animated:YES];

}
@end
