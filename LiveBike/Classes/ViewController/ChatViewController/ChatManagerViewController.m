//
//  ChatManagerViewController.m
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "ChatManagerViewController.h"

@interface ChatManagerViewController ()

@end

@implementation ChatManagerViewController
@synthesize viewArray;

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
    chatBtn.hidden = NO;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    chatBtn.hidden = YES;
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{   
    UIImage *chatImg  = [UIImage imageNamed:@"chat.png"];
    chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chatBtn.tag = 1;
    chatBtn.frame     = CGRectMake(320-chatImg.size.width-20, 10,
                                   chatImg.size.width, chatImg.size.height);
    [chatBtn setImage:chatImg forState:UIControlStateNormal];
    [chatBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:chatBtn];
    
    UIImage *chatMenuImg  = [UIImage imageNamed:@"chatMenu.png"];
    UIButton *chatMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chatMenuBtn.tag = 2;
    [chatMenuBtn setImage:chatMenuImg forState:UIControlStateNormal];
    [chatMenuBtn addTarget:self
                    action:@selector(doButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
    chatMenuBtn.frame = CGRectMake(0, self.view.frame.size.height-chatMenuImg.size.height+2,
                                   chatMenuImg.size.width, chatMenuImg.size.height);
    [self.view addSubview:chatMenuBtn];
    
    UIImage *frdImg  = [UIImage imageNamed:@"friend.png"];
    UIButton *frdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    frdBtn.tag = 3;
    [frdBtn setImage:frdImg forState:UIControlStateNormal];
    [frdBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    frdBtn.frame = CGRectMake(chatMenuImg.size.width, self.view.frame.size.height-frdImg.size.height,
                              frdImg.size.width, frdImg.size.height);
    [self.view addSubview:frdBtn];
    
    UIImage *groupImg  = [UIImage imageNamed:@"group.png"];
    UIButton *groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    groupBtn.tag = 4;
    [groupBtn setImage:groupImg forState:UIControlStateNormal];
    [groupBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    groupBtn.frame = CGRectMake(self.view.frame.size.width-groupImg.size.width,
                                self.view.frame.size.height-groupImg.size.height+2,
                                groupImg.size.width, groupImg.size.height);
    [self.view addSubview:groupBtn];
    
    viewArray = [[NSMutableArray alloc]init];
    
    ChatMainViewController *cVctr = [[ChatMainViewController alloc]init];
    cVctr.view.frame = CGRectMake(0, 64, 320, self.view.frame.size.height-frdImg.size.height-64);
    [viewArray insertObject:cVctr atIndex:0];
    
    FriendListViewController *fdVctr = [[FriendListViewController alloc]init];
    fdVctr.view.frame = CGRectMake(0, 64, 320, self.view.frame.size.height-frdImg.size.height-64);
    [viewArray insertObject:fdVctr atIndex:1];
    
    GroupListViewController *glVctr = [[GroupListViewController alloc]init];
    glVctr.view.frame = CGRectMake(0, 64, 320, self.view.frame.size.height-frdImg.size.height-64);
    [viewArray insertObject:glVctr atIndex:2];
    
    [self doButtonClicked:chatMenuBtn];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 2:
        {
            self.title = @"我的会话";
            UIViewController *chatVctr = [viewArray objectAtIndex:0];
            if ([chatVctr.view isDescendantOfView:self.view])
                [self.view bringSubviewToFront:chatVctr.view];
            else
                [self.view addSubview:chatVctr.view];
            
            UIViewController *mqVctr = [viewArray objectAtIndex:1];
            UIViewController *olVctr = [viewArray objectAtIndex:2];
            [mqVctr.view removeFromSuperview];
            [olVctr.view removeFromSuperview];
            break;
        }
        case 3:
        {
            self.title = @"我的好友";
            UIViewController *chatVctr = [viewArray objectAtIndex:1];
            if ([chatVctr.view isDescendantOfView:self.view])
                [self.view bringSubviewToFront:chatVctr.view];
            else
                [self.view addSubview:chatVctr.view];
            
            UIViewController *mqVctr = [viewArray objectAtIndex:0];
            UIViewController *olVctr = [viewArray objectAtIndex:2];
            [mqVctr.view removeFromSuperview];
            [olVctr.view removeFromSuperview];
            break;
        }
        case 4:
        {
            self.title = @"我的群组";
            UIViewController *chatVctr = [viewArray objectAtIndex:2];
            if ([chatVctr.view isDescendantOfView:self.view])
                [self.view bringSubviewToFront:chatVctr.view];
            else
                [self.view addSubview:chatVctr.view];
            
            UIViewController *mqVctr = [viewArray objectAtIndex:0];
            UIViewController *olVctr = [viewArray objectAtIndex:1];
            [mqVctr.view removeFromSuperview];
            [olVctr.view removeFromSuperview];
            break;
        }
        default:
            break;
    }
}
@end
