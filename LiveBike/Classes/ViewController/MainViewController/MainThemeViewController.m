//
//  MainViewController.m
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "MainThemeViewController.h"

@interface MainThemeViewController ()

@end

@implementation MainThemeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self iniUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
    navCtr.navigationBarHidden = YES;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark - Custom Action
- (FMDatabase *) getFMDatabase
{
    NSString *sqlFile  = @"gps.db";
    NSArray *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [cachePath objectAtIndex:0];
    NSString *databasePath = [cacheDir stringByAppendingPathComponent:sqlFile];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // Copy the database sql file from the resourcepath to the documentpath
    if (![fileManager fileExistsAtPath:databasePath]) {
        NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:sqlFile];
        NSError *error;
        [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:&error];
    }
    
    FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
    return db;
}

- (CLLocationCoordinate2D)zzTransGPS:(CLLocationCoordinate2D)yGps
{
    int TenLat = 0;
    int TenLog = 0;
    TenLat = (int)(yGps.latitude *10);
    TenLog = (int)(yGps.longitude*10);
    NSString *sql = [[NSString alloc]initWithFormat:@"select offLat,offLog from gpsT where lat=%d and log = %d",TenLat,TenLog];
    DebugLog(@"SQL:%@",sql);
    
    FMDatabase *db   = [self getFMDatabase];
    FMResultSet *rs  = [db executeQuery:sql];
    if (!rs)
    {
        DebugLog(@"ERROR:%s,%d", __func__, __LINE__);
    }
    
    int offLat=0;
    int offLog=0;
    while ([rs next])
    {
        offLat = [rs stringForColumnIndex:0].intValue;
        offLog = [rs stringForColumnIndex:1].intValue;
    }
    
//    sqlite3_stmt* stmtL = [m_sqlite NSRunSql:sql];
//    while (sqlite3_step(stmtL)==SQLITE_ROW)
//    {
//        offLat = sqlite3_column_int(stmtL, 0);
//        offLog = sqlite3_column_int(stmtL, 1);
//    }
    yGps.latitude  = yGps.latitude  + offLat*0.0001;
    yGps.longitude = yGps.longitude + offLog*0.0001;
    return yGps;
}


- (void) iniUI
{
    myPath   = [GMSMutablePath path];
    
    //open the gps db
    m_sqlite = [[CSqlite alloc]init];
    [m_sqlite openSqlite];
    
    meMarker = [[GMSMarker alloc] init];
    mapView_ = [GMSMapView mapWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                 camera:nil];
    mapView_.settings.compassButton    = YES;
    mapView_.settings.myLocationButton = NO;
    
    // Listen to the myLocation property of GMSMapView.
    [mapView_ addObserver:self
               forKeyPath:@"myLocation"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    [self.view addSubview:mapView_];
    
    if ([CLLocationManager locationServicesEnabled]) { // 检查定位服务是否可用
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.distanceFilter  = 100;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        [locationManager startUpdatingLocation]; // 开始定位
    }
    
    UIImage *menuImg  = [UIImage imageNamed:@"menu.png"];
    menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.tag       = 1;
    menuBtn.frame     = CGRectMake(10, self.view.frame.size.height-30-menuImg.size.height/2,
                                   menuImg.size.width, menuImg.size.height);
    [menuBtn setImage:menuImg
             forState:UIControlStateNormal];
    [menuBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];
    
    UIImage *startImg  = [UIImage imageNamed:@"start.png"];
    startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.tag       = 2;
    startBtn.frame     = CGRectMake(160-startImg.size.width/2,
                                    self.view.frame.size.height-30-startImg.size.height/2,
                                    startImg.size.width, startImg.size.height);
    [startBtn setImage:startImg
              forState:UIControlStateNormal];
    [startBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIImage *pepoleImg  = [UIImage imageNamed:@"pepole.png"];
    pepoleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pepoleBtn.tag       = 3;
    pepoleBtn.frame     = CGRectMake(320-pepoleImg.size.width-10,
                                     self.view.frame.size.height-30-pepoleImg.size.height/2,
                                     pepoleImg.size.width, pepoleImg.size.height);
    [pepoleBtn setImage:pepoleImg
               forState:UIControlStateNormal];
    [pepoleBtn addTarget:self
                  action:@selector(doButtonClicked:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pepoleBtn];
    
    UIImage *musicImg  = [UIImage imageNamed:@"music.png"];
    UIButton *musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    musicBtn.tag = 4;
    [musicBtn setImage:musicImg forState:UIControlStateNormal];
    [musicBtn setFrame:CGRectMake(10, 340, musicImg.size.width, musicImg.size.height)];
    [musicBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:musicBtn];
    
    UIImage *dropInImg  = [UIImage imageNamed:@"dropin.png"];
    UIButton *dropBtn   = [UIButton buttonWithType:UIButtonTypeCustom];
    dropBtn.tag = 5;
    [dropBtn setImage:dropInImg forState:UIControlStateNormal];
    [dropBtn setFrame:CGRectMake(10, 290, dropInImg.size.width, dropInImg.size.height)];
    [dropBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dropBtn];
    
    CGRect topRect    = CGRectMake(0, 0, 320, self.view.frame.size.height/4);
    CGRect midRect    = CGRectMake(0, 0, 320, self.view.frame.size.height/2);
    CGRect bottomRect = CGRectMake(0, 0, 320, self.view.frame.size.height-80);
    
    ShortCutView *scView = [[ShortCutView alloc]initWithFrame:midRect];
    scView.delegate    = self;
    scView.topFrame    = topRect;
    scView.midFrame    = midRect;
    scView.bottomFrame = bottomRect;
    [self.view addSubview:scView];
    
    UIGridView *gdView = [[UIGridView alloc]init];
    if ([gdView respondsToSelector:@selector(setSeparatorInset:)]) {
        [gdView setSeparatorInset:UIEdgeInsetsZero];
    }
    gdView.scrollEnabled = NO;
    gdView.uiGridViewDelegate = self;
    gdView.frame = CGRectMake(0, 60, scView.frame.size.width, scView.frame.size.height-100);
    [scView addSubview:gdView];
    
    //设置菜单
    [self setupMenuView];

    //设置开始菜单
    [self setupStartView];
    
    //设置微博直播提示
    [self setupLiveView];
    
    //设置停止服务
    [self setupStopActive];
    
    //设置倒计时
    [self setupStartTimeView];
    
    //设置Dropin
    [self setupDropInView];
}

- (void) setShowNormalUI
{
    menuBtn.hidden   = NO;
    startBtn.hidden  = NO;
    pepoleBtn.hidden = NO;
    
    camraBtn.hidden  = YES;
    stopBtn.hidden   = YES;
    activeRecordBtn.hidden = YES;
}

- (void) initDrivingUI
{
    //initDrivingUI
    menuBtn.hidden   = YES;
    startBtn.hidden  = YES;
    pepoleBtn.hidden = YES;
    
    camraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    camraBtn.tag       = 8;
    [camraBtn setImage:[UIImage imageNamed:@"camera.png"] forState:UIControlStateNormal];
    camraBtn.frame     = CGRectMake(10, self.view.frame.size.height-30-40/2,
                                    40, 40);
    [camraBtn addTarget:self
                action:@selector(doButtonClicked:)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:camraBtn];
    
    stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    stopBtn.tag       = 9;
    stopBtn.frame     = CGRectMake(140,self.view.frame.size.height-30-40/2,
                                   40, 40);
    [stopBtn setImage:[UIImage imageNamed:@"stopActive.png"] forState:UIControlStateNormal];
    [stopBtn addTarget:self
                 action:@selector(doButtonClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    activeRecordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    activeRecordBtn.tag       = 10;
    activeRecordBtn.frame     = CGRectMake(320-40-10,
                                           self.view.frame.size.height-30-40/2,
                                           40, 40);
    [activeRecordBtn setImage:[UIImage imageNamed:@"active.png"]
                     forState:UIControlStateNormal];
    [activeRecordBtn addTarget:self
                        action:@selector(doButtonClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:activeRecordBtn];
}

- (void) setupDropInView
{
    dropinMaskView = [[UIView alloc]init];
    dropinMaskView.frame = CGRectMake(0, 150,
                                      self.view.frame.size.width,
                                      40);
    dropinMaskView.backgroundColor = [UIColor clearColor];
    dropinMaskView.alpha = 0.f;
    [self.view addSubview:dropinMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        40);
    [dropinMaskView addSubview:backgroundView];
    
    UIScrollView *dropInScrollView = [[UIScrollView alloc]init];
    dropInScrollView.showsHorizontalScrollIndicator = NO;
    dropInScrollView.frame = CGRectMake(0, 0, dropinMaskView.frame.size.width, dropinMaskView.frame.size.height);
    dropInScrollView.contentSize = CGSizeMake(400, dropInScrollView.frame.size.height);
    [dropinMaskView addSubview:dropInScrollView];
    
    for (int i=0; i<10; i++)
    {
        UIImage *dropInImg  = [UIImage imageNamed:@"dropin.png"];
        UIButton *dropInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        dropInBtn.frame     = CGRectMake(i*35, 5, 30, 30);
        [dropInBtn setImage:dropInImg forState:UIControlStateNormal];
        [dropInBtn addTarget:self
                      action:@selector(selectDropInBtnClicked:)
            forControlEvents:UIControlEventTouchUpInside];
        [dropInScrollView addSubview:dropInBtn];
    }
}

- (void) setupStartTimeView
{
    startTimeMaskView         = [[UIView alloc]init];
    startTimeMaskView.frame   = CGRectMake(0, 0,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
    startTimeMaskView.backgroundColor = [UIColor clearColor];
    startTimeMaskView.alpha = 0.f;
    [self.view addSubview:startTimeMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [startTimeMaskView addSubview:backgroundView];
    
    startTimeView = [[PICircularProgressView alloc]initWithFrame:CGRectMake(85, 180, 150, 80)];
    startTimeView.progress   = 0;
    startTimeView.showText   = YES;
    startTimeView.showShadow = YES;
    startTimeView.thicknessRatio = 0.1;
    startTimeView.innerBackgroundColor = nil;
    startTimeView.outerBackgroundColor = nil;
    [startTimeMaskView addSubview:startTimeView];
}

- (void) setupLiveView
{
    liveMaskView = [[UIView alloc]init];
    liveMaskView.frame   = CGRectMake(0, 0,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
    liveMaskView.backgroundColor = [UIColor clearColor];
    liveMaskView.alpha = 0.f;
    [self.view addSubview:liveMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [liveMaskView addSubview:backgroundView];
    
    LBorderView *groupView = [[LBorderView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height/2-150/2,
                                                                          280,
                                                                          150)];
    groupView.borderType   = BorderTypeSolid;
    groupView.dashPattern  = 8;
    groupView.spacePattern = 8;
    groupView.borderWidth  = 1;
    groupView.cornerRadius = 5;
    groupView.borderColor  = [UIColor whiteColor];
    groupView.backgroundColor = [UIColor whiteColor];
    [liveMaskView addSubview:groupView];
    
    UILabel *infoLab = [[UILabel alloc]init];
    infoLab.text = @"对该活动环节启用微博实时直播?";
    infoLab.backgroundColor = [UIColor clearColor];
    infoLab.frame = CGRectMake(0, groupView.frame.size.height/2-40,
                                  groupView.frame.size.width, 20);
    infoLab.textAlignment = NSTextAlignmentCenter;
    [groupView addSubview:infoLab];
    
    UIButton *yesBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yesBtn.tag = 6;
    [yesBtn setTitle:@"是" forState:UIControlStateNormal];
    [yesBtn setFrame:CGRectMake(groupView.frame.size.width/2-110, groupView.frame.size.height-40, 100, 30)];
    [yesBtn addTarget:self
               action:@selector(doButtonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [groupView addSubview:yesBtn];
    
    UIButton *noBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    noBtn.tag = 7;
    [noBtn setTitle:@"否" forState:UIControlStateNormal];
    [noBtn setFrame:CGRectMake(groupView.frame.size.width/2+10, groupView.frame.size.height-40, 100, 30)];
    [noBtn addTarget:self
              action:@selector(doButtonClicked:)
    forControlEvents:UIControlEventTouchUpInside];
    [groupView addSubview:noBtn];
}

- (void) setupStopActive
{
    stopActiveMaskView = [[UIView alloc]init];
    stopActiveMaskView.frame   = CGRectMake(0, 0,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
    stopActiveMaskView.backgroundColor = [UIColor clearColor];
    stopActiveMaskView.alpha = 0.f;
    [self.view addSubview:stopActiveMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [stopActiveMaskView addSubview:backgroundView];
    
    LBorderView *groupView = [[LBorderView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height/2-150/2,
                                                                          280,
                                                                          150)];
    groupView.borderType   = BorderTypeSolid;
    groupView.dashPattern  = 8;
    groupView.spacePattern = 8;
    groupView.borderWidth  = 1;
    groupView.cornerRadius = 5;
    groupView.borderColor  = [UIColor whiteColor];
    groupView.backgroundColor = [UIColor whiteColor];
    [stopActiveMaskView addSubview:groupView];
    
    UILabel *infoLab = [[UILabel alloc]init];
    infoLab.text = @"你确定要退出当前活动吗?";
    infoLab.backgroundColor = [UIColor clearColor];
    infoLab.frame = CGRectMake(0, groupView.frame.size.height/2-40,
                               groupView.frame.size.width, 20);
    infoLab.textAlignment = NSTextAlignmentCenter;
    [groupView addSubview:infoLab];
    
    UIButton *yesBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yesBtn.tag = 1;
    [yesBtn setTitle:@"是" forState:UIControlStateNormal];
    [yesBtn setFrame:CGRectMake(groupView.frame.size.width/2-110, groupView.frame.size.height-40, 100, 30)];
    [yesBtn addTarget:self
               action:@selector(doStopActiveClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [groupView addSubview:yesBtn];
    
    UIButton *noBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    noBtn.tag = 2;
    [noBtn setTitle:@"否" forState:UIControlStateNormal];
    [noBtn setFrame:CGRectMake(groupView.frame.size.width/2+10, groupView.frame.size.height-40, 100, 30)];
    [noBtn addTarget:self
              action:@selector(doStopActiveClicked:)
    forControlEvents:UIControlEventTouchUpInside];
    [groupView addSubview:noBtn];
}

- (void) setupMenuView
{
    menuMaskView = [[UIView alloc]init];
    menuMaskView.frame   = CGRectMake(0, 0,
                                  self.view.frame.size.width,
                                  self.view.frame.size.height);
    menuMaskView.backgroundColor = [UIColor clearColor];
    menuMaskView.alpha = 0.f;
    [self.view addSubview:menuMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [menuMaskView addSubview:backgroundView];
    
    UITableView *menuTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, 320, 343)];
    menuTab.tag = 1;
    menuTab.delegate     = self;
    menuTab.dataSource   = self;
    menuTab.backgroundColor = [UIColor clearColor];
    [menuMaskView addSubview:menuTab];
}

- (void) setupStartView
{
    startMaskView = [[UIView alloc]init];
    startMaskView.frame   = CGRectMake(0, 0,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height);
    startMaskView.backgroundColor = [UIColor clearColor];
    startMaskView.alpha = 0.f;
    [self.view addSubview:startMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [startMaskView addSubview:backgroundView];
    
    UIButton *hideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hideBtn.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [hideBtn addTarget:self action:@selector(hideView:) forControlEvents:UIControlEventTouchUpInside];
    [startMaskView addSubview:hideBtn];
    
    UITableView *menuTab = [[UITableView alloc]initWithFrame:CGRectMake(20, 130, 280, 147)];
    if ([menuTab respondsToSelector:@selector(setSeparatorInset:)]) {
        [menuTab setSeparatorInset:UIEdgeInsetsZero];
    }
    menuTab.tag          = 2;
    menuTab.delegate     = self;
    menuTab.dataSource   = self;
    menuTab.backgroundColor = [UIColor clearColor];
    [startMaskView addSubview:menuTab];
}

- (void) showCamera
{
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择"
                                             delegate:self
                                    cancelButtonTitle:nil
                               destructiveButtonTitle:@"取消"
                                    otherButtonTitles:@"拍照",@"从相册选择", nil];
        
    }
    
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择"
                                            delegate:self
                                   cancelButtonTitle:nil
                              destructiveButtonTitle:@"取消"
                                   otherButtonTitles:@"从相册选择", nil];
        
    }
    sheet.tag = 255;
    [sheet showInView:self.view];
}

- (void) stopActive
{
    stopMaskView = [[UIView alloc]init];
    stopMaskView.frame   = CGRectMake(0, 0,
                                       self.view.frame.size.width,
                                       self.view.frame.size.height);
    stopMaskView.backgroundColor = [UIColor clearColor];
    stopMaskView.alpha = 1.f;
    [self.view addSubview:stopMaskView];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.alpha   = 0.5;
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    backgroundView.frame   = CGRectMake(0, 0,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height);
    [stopMaskView addSubview:backgroundView];
    
    UITableView *menuTab = [[UITableView alloc]initWithFrame:CGRectMake(20, 130, 280, 147)];
    if ([menuTab respondsToSelector:@selector(setSeparatorInset:)]) {
        [menuTab setSeparatorInset:UIEdgeInsetsZero];
    }
    menuTab.tag          = 3;
    menuTab.delegate     = self;
    menuTab.dataSource   = self;
    menuTab.backgroundColor = [UIColor clearColor];
    [stopMaskView addSubview:menuTab];
}

- (void) showActiceRecorde
{
    SportAnalysisViewController *spVctr = [[SportAnalysisViewController alloc]init];
    [self.navigationController pushViewController:spVctr animated:YES];
}

- (void) timeOut:(NSTimer *) timer
{
    if (startTimeView.progress == 1)
    {
        [timer invalidate];
        startTimeMaskView.alpha = 0.0f;
        
        [self initDrivingUI];
    }
    else
    {
        startTimeView.content   = [NSString stringWithFormat:@"%d", (int)(10-startTimeView.progress*10)];
        startTimeView.progress += 0.1;
    }
}

#pragma mark -
#pragma mark - UIActionSheetDelegate


#pragma mark -
#pragma mark - ShortViewDelegate
- (void) view:(ShortCutView *) view statues:(ViewStatues) status;
{
    UIView *gridView  = nil;
    NSArray *subViews = view.subviews;
    for (UIView *view in subViews)
    {
        if ([view isKindOfClass:[UIGridView class]])
        {
            gridView = view;
        }
    }
    
    switch (status)
    {
        case kViewTopStatus:
        {
            gridView.frame = view.topFrame;
            break;
        }
        case kViewMidStatus:
        {
            gridView.frame = view.midFrame;
            break;
        }
        case kViewBottomStatus:
        {
            gridView.frame = view.bottomFrame;
            break;
        }
        default:
            break;
    }
}

#pragma mark -
#pragma mark - UIGridViewDelegate
- (void) gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
    
}

- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
    return 160;
}

- (CGFloat) gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
    return 40;
}

- (NSInteger) numberOfColumnsOfGridView:(UIGridView *) grid
{
    return 2;
}

- (NSInteger) numberOfCellsOfGridView:(UIGridView *) grid
{
    return 6;
}

- (UIGridViewCell *) gridView:(UIGridView *)grid cellForRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
    UIGridViewCell *cell = [[UIGridViewCell alloc]init];
    switch (rowIndex)
    {
        case 0:
        {
            switch (columnIndex)
            {
                case 0:
                {
                    CollectParamsView *pView = [[CollectParamsView alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
                    pView.imgView.image = [UIImage imageNamed:@"heart.png"];
                    pView.nameLab.text  = @"心率";
                    pView.valueLab.text = @"10";
                    pView.valueInfoLab.text = @"bmp";
                    [cell addSubview:pView];
                    break;
                }
                case 1:
                {
                    CollectParamsView *pView = [[CollectParamsView alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
                    pView.imgView.image = [UIImage imageNamed:@"heart.png"];
                    pView.nameLab.text  = @"平均速度";
                    pView.valueLab.text = @"12.2";
                    pView.valueInfoLab.text = @"英里时";
                    [cell addSubview:pView];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:
        {
            switch (columnIndex)
            {
                case 0:
                {
                    CollectParamsView *pView = [[CollectParamsView alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
                    pView.imgView.image = [UIImage imageNamed:@"heart.png"];
                    pView.nameLab.text  = @"卡路里";
                    pView.valueLab.text = @"12";
                    pView.valueInfoLab.text = @"卡";
                    [cell addSubview:pView];
                    break;
                }
                case 1:
                {
                    CollectParamsView *pView = [[CollectParamsView alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
                    pView.imgView.image = [UIImage imageNamed:@"heart.png"];
                    pView.nameLab.text  = @"距离";
                    pView.valueLab.text = @"12";
                    pView.valueInfoLab.text = @"分钟/公里";
                    [cell addSubview:pView];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:
        {
            switch (columnIndex)
            {
                case 0:
                {
                    CollectParamsView *pView = [[CollectParamsView alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
                    pView.valueLab.text      = @"01:11:12";
                    pView.valueLab.font      = [UIFont systemFontOfSize:18.f];
                    pView.valueLab.frame = CGRectMake(0, 0, 160, 20);
                    
                    pView.valueInfoLab.text  = @"时 分 秒";
                    pView.valueInfoLab.font  = [UIFont systemFontOfSize:18.f];
                    pView.valueInfoLab.frame = CGRectMake(0, 20, 160, 20);
                    [cell addSubview:pView];
                    break;
                }
                case 1:
                {
                    CollectParamsView *pView = [[CollectParamsView alloc]initWithFrame:CGRectMake(0, 0, 160, 40)];
                    pView.valueLab.text      = @"01:11:12";
                    pView.valueLab.font      = [UIFont systemFontOfSize:18.f];
                    pView.valueLab.frame = CGRectMake(0, 0, 160, 20);
                    
                    pView.valueInfoLab.text  = @"时 分 秒";
                    pView.valueInfoLab.font  = [UIFont systemFontOfSize:18.f];
                    pView.valueInfoLab.frame = CGRectMake(0, 20, 160, 20);
                    [cell addSubview:pView];
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
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate and UITableViewDatasource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag)
    {
        case 1:
        {
            return 7;
        }
        case 2:
        {
            return 3;
        }
        case 3:
        {
            return 3;
        }
        default:
            break;
    }
    return 1;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *idString = @"idString";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idString];
    switch (tableView.tag)
    {
        case 1:    //menu
        {
            cell.backgroundColor  = [UIColor clearColor];
            //    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
            switch (indexPath.row)
            {
                case 0:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"灯光管理";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 1:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"路线管理";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 2:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"运动记录";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 3:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"语音提示设置";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 160, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 4:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"系统设置";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 5:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *menuInfoLab = [[UILabel alloc]init];
                    menuInfoLab.text  = @"消息管理";
                    menuInfoLab.backgroundColor = [UIColor clearColor];
                    menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5,
                                                   100, 20);
                    [cell addSubview:menuInfoLab];
                    break;
                }
                case 6:
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    //            UILabel *menuInfoLab = [[UILabel alloc]init];
                    //            menuInfoLab.text  = @"灯光管理";
                    //            menuInfoLab.backgroundColor = [UIColor clearColor];
                    //            menuInfoLab.frame = CGRectMake(10+10+menuImg.size.width, 14.5, 100, 20);
                    //            [cell addSubview:menuInfoLab];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:   //start menu
        {
            switch (indexPath.row)
            {
                case 0:     //随意骑行
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"随意骑行";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 100, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 1:     //选择路线骑行
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"选择路线";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 100, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 2:     //参加活动
                {
                    UIImage *menuImg = [UIImage imageNamed:@"menu.png"];
                    UIImageView *menuImgView = [[UIImageView alloc]initWithImage:menuImg];
                    menuImgView.frame        = CGRectMake(10, 0, menuImg.size.width, menuImg.size.height);
                    [cell addSubview:menuImgView];
                    
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"红树林-深圳湾比赛";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(80, 14.5, 200, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 3:     //停止活动
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"停止并保存活动进程";
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.textAlignment   = NSTextAlignmentCenter;
                    bikingLab.frame = CGRectMake(0, 14.5, 280, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 1:
                {
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"停止并取消保存活动进程";
                    bikingLab.textAlignment   = NSTextAlignmentCenter;
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(0, 14.5, 280, 20);
                    [cell addSubview:bikingLab];
                    break;
                }
                case 2:
                {
                    UILabel *bikingLab = [[UILabel alloc]init];
                    bikingLab.text  = @"恢复";
                    bikingLab.textAlignment   = NSTextAlignmentCenter;
                    bikingLab.backgroundColor = [UIColor clearColor];
                    bikingLab.frame = CGRectMake(0, 14.5, 280, 20);
                    [cell addSubview:bikingLab];
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
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (tableView.tag)
    {
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:   //灯光管理
                {
                    LightManagerViewController *lVctr = [[LightManagerViewController alloc]init];
                    [self.navigationController pushViewController:lVctr animated:YES];
                    break;
                }
                case 1:   //线路管理
                {
                    RoadManagerViewController *rVctr = [[RoadManagerViewController alloc]init];
                    [self.navigationController pushViewController:rVctr animated:YES];
                    break;
                }
                case 2:   //运动记录
                {
                    SportRecordViewController *sVctr = [[SportRecordViewController alloc]init];
                    [self.navigationController pushViewController:sVctr animated:YES];
                    break;
                }
                case 3:   //语音提示页面
                {
                    SoundSettingViewController *sVctr = [[SoundSettingViewController alloc]init];
                    [self.navigationController pushViewController:sVctr animated:YES];
                    break;
                }
                case 4:   //系统设置
                {
                    SettingViewController *sVctr = [[SettingViewController alloc]init];
                    [self.navigationController pushViewController:sVctr animated:YES];
                    break;
                }
                case 5:   //消息管理
                {
                    MessageViewController *mVctr = [[MessageViewController alloc]init];
                    [self.navigationController pushViewController:mVctr animated:YES];
                    break;
                }
                case 6:
                {
                    menuMaskView.alpha = 0.0f;
                    break;
                }
                default:
                    break;
            }
            menuMaskView.alpha = 0.0f;
            break;
        }
        case 2:
        {
            startMaskView.alpha = 0.0f;
            switch (indexPath.row)
            {
                case 0:   //随意骑行
                {
                    liveMaskView.alpha = 1.f;
                    break;
                }
                case 1:   //选择路线骑行
                {
                    break;
                }
                case 2:   //参加活动骑行
                {
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 3:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    stopMaskView.alpha = 0.0f;
                    
                    SaveActiveViewController *sVctr = [[SaveActiveViewController alloc]init];
                    [self.navigationController pushViewController:sVctr animated:YES];
                    break;
                }
                case 1:  //恢复Normal状态
                {
                    stopMaskView.alpha = 0.0f;
                    stopActiveMaskView.alpha = 1.0f;
                    break;
                }
                case 2:
                {
                    stopMaskView.alpha = 0.0f;
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

#pragma mark -
#pragma mark - Clicked Action
- (void) doStopActiveClicked:(id)sender
{
    stopActiveMaskView.alpha = 0.0f;
    [self setShowNormalUI];
}

- (void) selectDropInBtnClicked:(id)sender
{
    dropinMaskView.alpha = 0.0f;
}

- (void) hideView:(id)sender
{
    startMaskView.alpha = 0.0f;
}

- (void) doButtonClicked:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UINavigationController *navCtr = (UINavigationController *)appDelegate.window.rootViewController;
    
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 1:       //菜单
        {
            menuMaskView.alpha = 1.0f;
            break;
        }
        case 2:       //开始
        {
            startMaskView.alpha = 1.0f;
            break;
        }
        case 3:       //会话
        {
            ChatManagerViewController *cmVctr = [[ChatManagerViewController alloc]init];
            [navCtr pushViewController:cmVctr animated:YES];
            break;
        }
        case 4:       //音乐
        {
            MusicViewController *mVctr = [[MusicViewController alloc]init];
            [navCtr pushViewController:mVctr animated:YES];
            break;
        }
        case 5:       //dropin
        {
            if (dropinMaskView.alpha==0.0f)
                dropinMaskView.alpha = 1.0f;
            else
                dropinMaskView.alpha = 0.0f;
            break;
        }
        case 6:       //微博直播是
        {
            liveMaskView.alpha      = 0.f;
            startTimeMaskView.alpha = 1.0f;
            [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(timeOut:)
                                           userInfo:nil
                                            repeats:YES];
            break;
        }
        case 7:       //微博直播否
        {
            liveMaskView.alpha      = 0.f;
            startTimeMaskView.alpha = 1.0f;
            [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(timeOut:)
                                           userInfo:nil
                                            repeats:YES];
            break;
        }
        case 8:       //照相
        {
            [self showCamera];
            break;
        }
        case 9:       //停止
        {
            [self stopActive];
            break;
        }
        case 10:      //活动记录
        {
            [self showActiceRecorde];
            break;
        }
        default:
            break;
    }
}

#pragma mark - KVO updates
// 定位成功时调用
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D mylocation = newLocation.coordinate;//手机GPS
    NSLog(@"location:%f,%f", mylocation.longitude,mylocation.latitude);
    
    meLocation = [self zzTransGPS:mylocation];///火星GPS
    
    //添加到我的路径
    [myPath addCoordinate:meLocation];
    myPolyline = [GMSPolyline polylineWithPath:myPath];
    myPolyline.strokeWidth = 5.f;
    myPolyline.strokeColor = [UIColor redColor];
    myPolyline.map = mapView_;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:meLocation.latitude
                                                            longitude:meLocation.longitude
                                                                 zoom:15];
    mapView_.camera = camera;
    
    meMarker.title = @"我的位置";
    meMarker.icon = [UIImage imageNamed:@"glow-marker"];
    meMarker.position = meLocation;
    meMarker.map = mapView_;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    //    if (!firstLocationUpdate_) {
    // If the first location update has not yet been recieved, then jump to that
    // location.'
    firstLocationUpdate_ = YES;                                                                                                                                                                                                                                                  
    //    CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
    //        NSLog(@"location11:%f, %f", location.coordinate.latitude,location.coordinate.longitude);
    //
    //
    //        mapView_.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
    //                                                         zoom:14];
    //    }
}
@end
