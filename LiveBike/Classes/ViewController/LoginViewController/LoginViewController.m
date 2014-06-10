//
//  LoginViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Custom Action
- (void) initUI
{
    UITextField *userNameFld = [[UITextField alloc]init];
    userNameFld.borderStyle  = UITextBorderStyleLine;
    userNameFld.frame        = CGRectMake(70, 140, 180, 30);
    userNameFld.placeholder  = @"用户名";
    [self.view addSubview:userNameFld];
    
    UITextField *pwdFld = [[UITextField alloc]init];
    pwdFld.borderStyle  = UITextBorderStyleLine;
    pwdFld.frame        = CGRectMake(70, 180, 180, 30);
    pwdFld.placeholder  = @"密码";
    [self.view addSubview:pwdFld];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.tag = 1;
    [loginBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(110, 250, 100, 30);
    [self.view addSubview:loginBtn];
    
    UIButton *fgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fgBtn.tag = 2;
    [fgBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [fgBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    fgBtn.frame = CGRectMake(0, 300, 100, 30);
    [self.view addSubview:fgBtn];
    
    UIButton *rgBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rgBtn.tag = 3;
    [rgBtn addTarget:self
              action:@selector(doButtonClicked:)
    forControlEvents:UIControlEventTouchUpInside];
    [rgBtn setTitle:@"注册新账号" forState:UIControlStateNormal];
    rgBtn.frame = CGRectMake(220, 300, 100, 30);
    [self.view addSubview:rgBtn];
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 1:  //登录
        {
            ThemeViewController *thVctr    = [[ThemeViewController alloc]init];
            UINavigationController *navCtr = [[UINavigationController alloc]initWithRootViewController:thVctr];
            AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
            appDelegate.window.rootViewController = navCtr;
            break;
        }
        case 2:  //忘记密码
        {
            break;
        }
        case 3:   //注册
        {
            SexViewController *sVctr = [[SexViewController alloc]init];
            [self.navigationController pushViewController:sVctr animated:YES];
            break;
        }
        default:
            break;
    }
}
@end
