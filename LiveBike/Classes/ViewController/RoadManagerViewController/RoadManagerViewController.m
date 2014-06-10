//
//  RoadManagerViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "RoadManagerViewController.h"

@interface RoadManagerViewController ()

@end

@implementation RoadManagerViewController

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
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.tag = 0;
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 20, 60, 30);
    [backBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton *markBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    markBtn.tag = 1;
    [markBtn setTitle:@"已标记" forState:UIControlStateNormal];
    markBtn.frame = CGRectMake(60, 20, 60, 30);
    [markBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:markBtn];
    
    UIButton *compeletBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    compeletBtn.tag = 2;
    [compeletBtn setTitle:@"已完成" forState:UIControlStateNormal];
    compeletBtn.frame = CGRectMake(120, 20, 60, 30);
    [compeletBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:compeletBtn];
    
    UIButton *createBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    createBtn.tag = 3;
    [createBtn setTitle:@"已创建" forState:UIControlStateNormal];
    createBtn.frame = CGRectMake(180, 20, 60, 30);
    [createBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:createBtn];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addBtn.tag = 4;
    [addBtn setTitle:@"创建" forState:UIControlStateNormal];
    addBtn.frame = CGRectMake(240, 20, 60, 30);
    [addBtn addTarget:self
                  action:@selector(doButtonClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UITableView *roadTab = [[UITableView alloc]init];
    roadTab.delegate = self;
    roadTab.dataSource = self;
    roadTab.frame = CGRectMake(0, 80, 320, self.view.frame.size.height-80);
    [self.view addSubview:roadTab];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.f;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        cell.imageView.image = [UIImage imageNamed:@"roadmap.png"];
        
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.text = @"大围-大梅沙";
        nameLab.font  = [UIFont systemFontOfSize:20.f];
        nameLab.frame = CGRectMake(90, 10, 250, 20);
        [cell addSubview:nameLab];
        
        UILabel *distLab = [[UILabel alloc]init];
        distLab.text = @"29英里 远";
        distLab.font  = [UIFont systemFontOfSize:12.f];
        distLab.frame = CGRectMake(90, 30, 250, 20);
        [cell addSubview:distLab];
        
        UILabel *heightLab = [[UILabel alloc]init];
        heightLab.text = @"234英尺";
        heightLab.font  = [UIFont systemFontOfSize:12.f];
        heightLab.frame = CGRectMake(90, 50, 250, 20);
        [cell addSubview:heightLab];
        
        UIImageView *markImgView = [[UIImageView alloc]init];
        markImgView.image = [UIImage imageNamed:@"roadmap.png"];
        markImgView.frame = CGRectMake(320-10-30, 20, 30, 30);
        [cell addSubview:markImgView];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RoadDetailViewController *rdVctr = [[RoadDetailViewController alloc]init];
    [self.navigationController pushViewController:rdVctr animated:YES];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 0:
        {
            [self.navigationController popViewControllerAnimated:YES];
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
            AddRoadViewController *arVctr = [[AddRoadViewController alloc]init];
            [self.navigationController pushViewController:arVctr animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
