//
//  CollectParamsView.h
//  LiveBike
//
//  Created by Lynn on 14-6-3.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _tagParamsType{
    kSetSpeedType = 0,    //配速
    kTimeType,            //总时间
    kSpeedType,           //平均速度
    kCalsType,            //卡路里
    kDistanceType,        //距离
    kHeartType,           //心率
}ParamsType;

@interface CollectParamsView : UIView

@property (nonatomic, strong) UIImageView  *imgView;
@property (nonatomic, strong) UILabel      *nameLab;
@property (nonatomic, strong) UILabel      *valueLab;
@property (nonatomic, strong) UILabel      *valueInfoLab;
@end
