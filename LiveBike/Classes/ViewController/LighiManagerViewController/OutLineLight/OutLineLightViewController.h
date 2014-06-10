//
//  OutLineLightViewController.h
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OutLineLightViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    int rowCount;
    UITableView *lightTab;
}
@end
