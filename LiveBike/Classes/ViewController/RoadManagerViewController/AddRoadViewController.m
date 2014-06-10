//
//  AddRoadViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "AddRoadViewController.h"

@interface AddRoadViewController ()

@end

@implementation AddRoadViewController

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
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.tag = 0;
    [backBtn setImage:[UIImage imageNamed:@"backIcon.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 10, 60, 60);
    [self.view addSubview:backBtn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 1;
    [btn1 setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(54, 10, 60, 60);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 2;
    [btn2 setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(108, 10, 60, 60);
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.tag = 3;
    [btn3 setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(doButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn3.frame = CGRectMake(162, 10, 60, 60);
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.tag = 4;
    [btn4 setImage:[UIImage imageNamed:@"4.png"]
          forState:UIControlStateNormal];
    [btn4 addTarget:self
             action:@selector(doButtonClicked:)
   forControlEvents:UIControlEventTouchUpInside];
    btn4.frame = CGRectMake(216, 10, 60, 60);
    [self.view addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.tag = 5;
    [btn5 setImage:[UIImage imageNamed:@"5.png"]
          forState:UIControlStateNormal];
    [btn5 addTarget:self
             action:@selector(doButtonClicked:)
   forControlEvents:UIControlEventTouchUpInside];
    btn5.frame = CGRectMake(270, 10, 60, 60);
    [self.view addSubview:btn5];
    
    UITableView *roadTab = [[UITableView alloc]init];
    roadTab.delegate     = self;
    roadTab.dataSource   = self;
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
            break;
        }
        case 5:
        {
            RoadMapViewController *roadMapVctr = [[RoadMapViewController alloc]init];
            [self.navigationController pushViewController:roadMapVctr animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
