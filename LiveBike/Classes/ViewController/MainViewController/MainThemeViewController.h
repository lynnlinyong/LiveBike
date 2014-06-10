//
//  MainViewController.h
//  LiveBike
//
//  Created by Lynn on 14-5-20.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainThemeViewController : UIViewController<UITableViewDelegate,
                                                UITableViewDataSource,
                                                CLLocationManagerDelegate,
                                                UIActionSheetDelegate,
                                                UIGridViewDelegate,
                                                ShortCutViewDelegate>
{
    CSqlite           *m_sqlite;
    UIView            *menuMaskView;
    UIView            *startMaskView;
    UIView            *liveMaskView;
    UIView            *dropinMaskView;
    UIView            *stopMaskView;
    UIView            *stopActiveMaskView;
    
    UIButton *menuBtn;
    UIButton *pepoleBtn;
    UIButton *startBtn;
    
    UIButton *camraBtn;
    UIButton *stopBtn;
    UIButton *activeRecordBtn;
    
    GMSMapView        *mapView_;
    BOOL              firstLocationUpdate_;
    CLLocationManager *locationManager;
    GMSMarker         *meMarker;
    CLLocationCoordinate2D meLocation;
    
    GMSMutablePath  *myPath;
    GMSPolyline     *myPolyline;
    
    PICircularProgressView *startTimeView;
    UIView          *startTimeMaskView;
}
@end
