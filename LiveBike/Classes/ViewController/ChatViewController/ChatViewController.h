//
//  ChatViewController.h
//  LiveBike
//
//  Created by Lynn on 14-6-1.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageDisplayViewController;
@interface ChatViewController : MessageDisplayViewController<UITableViewDataSource,UITableViewDelegate>

@end
