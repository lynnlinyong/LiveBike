//
//  NumberRule.h
//  LiveBike
//
//  Created by Lynn on 14-5-19.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _ruleType{
    kWeightType=0,       //体重
    kHeightType,         //身高
    kBirthType,          //生日
}RuleType;

@interface NumberRule : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, assign) float startNumber;
@property (nonatomic, assign) float endNumber;
@property (nonatomic, assign) float dValue;
@property (nonatomic, assign) RuleType ruleType;

- (id)initWithFrame:(CGRect)frame withType:(RuleType) type;
- (void) initUI;
@end
