//
//  SportRecordViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "SportRecordViewController.h"

@interface SportRecordViewController ()

@end

@implementation SportRecordViewController

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

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"运动记录";
    
    UILabel *distLab = [[UILabel alloc]init];
    distLab.text = @"18英里";
    distLab.font = [UIFont systemFontOfSize:20.f];
    distLab.frame = CGRectMake(40, 84, 100, 50);
    distLab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:distLab];
    
    UILabel *countLab = [[UILabel alloc]init];
    countLab.text = @"运动记录:11";
    countLab.font = [UIFont systemFontOfSize:14.f];
    countLab.frame = CGRectMake(140, 70, 100, 14);
    countLab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:countLab];
    
    UILabel *castTimeLab = [[UILabel alloc]init];
    castTimeLab.text = @"时长:02:33:36";
    castTimeLab.font = [UIFont systemFontOfSize:14.f];
    castTimeLab.frame = CGRectMake(140, 90, 100, 14);
    castTimeLab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:castTimeLab];
    
    UILabel *castDistLab = [[UILabel alloc]init];
    castDistLab.text = @"海拔:23英尺";
    castDistLab.font = [UIFont systemFontOfSize:14.f];
    castDistLab.frame = CGRectMake(140, 115, 100, 14);
    castDistLab.backgroundColor = [UIColor clearColor];
    [self.view addSubview:castDistLab];
    
    UITableView *spTab = [[UITableView alloc]init];
    spTab.delegate     = self;
    spTab.dataSource   = self;
    spTab.frame = CGRectMake(0, 150, 320, self.view.frame.size.height-150-50);
    [self.view addSubview:spTab];
    
    UIButton *downActiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downActiveBtn.tag   = 1;
    [downActiveBtn setImage:[UIImage imageNamed:@"downActive.png"]
                   forState:UIControlStateNormal];
    downActiveBtn.frame = CGRectMake(60, self.view.frame.size.height-50, 100, 40);
    [downActiveBtn addTarget:self
                      action:@selector(doButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downActiveBtn];
    
    UIButton *addActiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addActiveBtn.tag   = 2;
    [addActiveBtn setImage:[UIImage imageNamed:@"addActice.png"]
                  forState:UIControlStateNormal];
    addActiveBtn.frame = CGRectMake(160, self.view.frame.size.height-50, 100, 40);
    [addActiveBtn addTarget:self
                      action:@selector(doButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addActiveBtn];
}

#pragma mark -
#pragma makr - Clicked Action
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
            AddActiveRecordViewController *aaVctr = [[AddActiveRecordViewController alloc]init];
            [self.navigationController pushViewController:aaVctr animated:YES];
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
    return 2;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString    = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        UILabel *timeLab = [[UILabel alloc]init];
        timeLab.font     = [UIFont systemFontOfSize:12.f];
        timeLab.text     = @"4月24日(2014) 星期五 12:35";
        timeLab.backgroundColor = [UIColor clearColor];
        timeLab.frame    = CGRectMake(10, 0, 200, 12);
        [cell addSubview:timeLab];
        
        UILabel *driveLab = [[UILabel alloc]init];
        driveLab.text = @"骑自行车";
        driveLab.backgroundColor = [UIColor clearColor];
        driveLab.font = [UIFont systemFontOfSize:12.f];
        driveLab.frame= CGRectMake(300-10-100, 0, 100, 12);
        [cell addSubview:driveLab];
        
        UILabel *distLab = [[UILabel alloc]init];
        distLab.text  = @"5英里";
        distLab.font  = [UIFont systemFontOfSize:20.f];
        distLab.frame = CGRectMake(10, 20, 200, 20);
        distLab.backgroundColor = [UIColor clearColor];
        [cell addSubview:distLab];
        
        UIImageView *motionImgView = [[UIImageView alloc]init];
        motionImgView.image =[UIImage imageNamed:@"motion.png"];
        motionImgView.frame = CGRectMake(300-10-40, 20, 40, 40);
        [cell addSubview:motionImgView];
        
        UILabel *totalTimeLab = [[UILabel alloc]init];
        totalTimeLab.text = @"00:23:45 6英尺";
        totalTimeLab.font  = [UIFont systemFontOfSize:12.f];
        totalTimeLab.frame = CGRectMake(10, 50, 200, 20);
        totalTimeLab.backgroundColor = [UIColor clearColor];
        [cell addSubview:totalTimeLab];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
