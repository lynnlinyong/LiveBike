//
//  StartMenuViewController.h
//  LiveBike
//
//  Created by Lynn on 14-5-30.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol StartMenuViewControllerDelegate;

@interface StartMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (assign, nonatomic) id <StartMenuViewControllerDelegate>delegate;
@end

@protocol StartMenuViewControllerDelegate<NSObject>
@optional
- (void)cancelButtonClicked:(id)secondDetailViewController;
@end