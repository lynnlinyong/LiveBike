//
//  ShortCutView.h
//  LiveBike
//
//  Created by Lynn on 14-6-3.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _tagViewStatues{
    kViewTopStatus = 0,
    kViewMidStatus,
    kViewBottomStatus
}ViewStatues;

@class ShortCutView;
@protocol  ShortCutViewDelegate <NSObject>
- (void) view:(ShortCutView *) view statues:(ViewStatues) status;
@end

@interface ShortCutView : UIView
{
    CGPoint  point;
    CGPoint  endPoint;
    int i;
}
@property (nonatomic, assign) id<ShortCutViewDelegate> delegate;
@property (nonatomic,assign)  CGRect topFrame;
@property (nonatomic,assign)  CGRect midFrame;
@property (nonatomic,assign)  CGRect bottomFrame;
@end
