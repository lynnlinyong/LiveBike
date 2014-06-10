//
//  CollectParamsView.m
//  LiveBike
//
//  Created by Lynn on 14-6-3.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "CollectParamsView.h"

@implementation CollectParamsView
@synthesize imgView;
@synthesize nameLab;
@synthesize valueLab;
@synthesize valueInfoLab;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        imgView        = [[UIImageView alloc]init];
        imgView.frame  = CGRectMake(30, 0, 20, 20);
        [self addSubview:imgView];
        
        nameLab        = [[UILabel alloc]init];
        nameLab.textAlignment = NSTextAlignmentCenter;
        nameLab.frame  = CGRectMake(0, 20, 80, 20);
        nameLab.font   = [UIFont systemFontOfSize:8.f];
        [self addSubview:nameLab];
        
        valueLab       = [[UILabel alloc]init];
        valueLab.textAlignment = NSTextAlignmentCenter;
        valueLab.frame = CGRectMake(80, 0, 80, 20);
        valueLab.font  = [UIFont systemFontOfSize:8.f];
        [self addSubview:valueLab];
        
        valueInfoLab = [[UILabel alloc]init];
        valueInfoLab.textAlignment = NSTextAlignmentCenter;
        valueInfoLab.frame = CGRectMake(80, 20, 80, 20);
        valueInfoLab.font  = [UIFont systemFontOfSize:8.f];
        [self addSubview:valueInfoLab];
    }
    return self;
}

@end
