//
//  LightView.h
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LightView;
@protocol LightViewDelegate <NSObject>

- (void) view:(LightView *) view ClickedIndex:(int) index;

@end

@interface LightView : UIView
@property (nonatomic, assign) int  lightCount;
@property (nonatomic, assign) BOOL isShowNumber;
@property (nonatomic, assign) id<LightViewDelegate> delegate;
- (void) setupUI;
@end
