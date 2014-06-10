//
//  MessageViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

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
    self.title = @"消息管理";
    
    UIButton *msgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    msgBtn.tag = 1;
    [msgBtn setTitle:@"提醒通知"
            forState:UIControlStateNormal];
    msgBtn.frame = CGRectMake(50, 64, 100, 30);
    [msgBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:msgBtn];
    
    UIButton *newsBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    newsBtn.tag = 2;
    [newsBtn setTitle:@"新闻推送"
             forState:UIControlStateNormal];
    newsBtn.frame = CGRectMake(170, 64, 100, 30);
    [newsBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newsBtn];
    
    UITableView *msgTab = [[UITableView alloc]init];
    msgTab.delegate   = self;
    msgTab.dataSource = self;
    msgTab.frame = CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:msgTab];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        default:
            break;
    }
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

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString    = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        cell.imageView.image = [UIImage imageNamed:@"menu.png"];
        
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.text = @"v2.0版本更新";
        nameLab.backgroundColor = [UIColor clearColor];
        nameLab.frame = CGRectMake(80, 12, 200, 20);
        [cell addSubview:nameLab];
    }
    
    return cell;
}
@end
