//
//  TwoOfKindViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "TwoOfKindViewController.h"

@interface TwoOfKindViewController ()

@end

@implementation TwoOfKindViewController

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
    setBtn.hidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    setBtn.hidden = YES;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    self.title = @"对对碰";
    
    UIImage *setImg  = [UIImage imageNamed:@"setting.png"];
    setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    setBtn.frame = CGRectMake(320-20-setImg.size.width, 10,
                              setImg.size.width, setImg.size.height);
    [setBtn setImage:setImg
            forState:UIControlStateNormal];
    [setBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:setBtn];
    
    UITableView *twoKindTab = [[UITableView alloc]init];
    twoKindTab.delegate   = self;
    twoKindTab.dataSource = self;
    twoKindTab.frame      = CGRectMake(0, 0, self.view.frame.size.width,
                                       self.view.frame.size.height);
    [self.view addSubview:twoKindTab];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    TwoOfKindSettingViewController *tsVctr = [[TwoOfKindSettingViewController alloc]init];
    [self.navigationController pushViewController:tsVctr animated:YES];
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDataSource
- (int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height/6;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    if (cell)
    {
        UIImage *boyImg = [UIImage imageNamed:@"s_boy.png"];
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.image = boyImg;
        imgView.frame = CGRectMake(5, self.view.frame.size.height/12-boyImg.size.height/2,
                                   boyImg.size.width, boyImg.size.height);
        [cell addSubview:imgView];
        
        UILabel *infoLab = [[UILabel alloc]init];
        infoLab.backgroundColor = [UIColor clearColor];
        infoLab.text = @"和李四碰了一下";
        infoLab.font = [UIFont systemFontOfSize:14.f];
        infoLab.frame= CGRectMake(80, 5, 100, 14);
        [cell addSubview:infoLab];
        
        UILabel *timeLab = [[UILabel alloc]init];
        timeLab.text = @"2014-05-14 12:32";
        timeLab.backgroundColor = [UIColor clearColor];
        timeLab.font = [UIFont systemFontOfSize:14.f];
        timeLab.frame= CGRectMake(80, 29, 200, 14);
        [cell addSubview:timeLab];
        
        UILabel *locLab = [[UILabel alloc]init];
        locLab.text = @"深圳市福田区红树林";
        locLab.font = [UIFont systemFontOfSize:12.f];
        locLab.backgroundColor = [UIColor clearColor];
        locLab.frame= CGRectMake(80, 53, 200, 12);
        [cell addSubview:locLab];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
