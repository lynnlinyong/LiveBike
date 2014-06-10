//
//  LightView.m
//  LiveBike
//
//  Created by Lynn on 14-5-31.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "LightView.h"

#define LIGHT_WIDTH  20
#define LIGHT_HEIGHT 20

@implementation LightView
@synthesize lightCount;
@synthesize isShowNumber;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        lightCount   = 1;
        isShowNumber = NO;
    }
    return self;
}

#pragma mark -
#pragma mark - Custom Action
- (void) setupUI
{
    UIImage *lightImg = [UIImage imageNamed:@"light.png"];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            self.frame.size.width, LIGHT_HEIGHT);
    
    float offset = self.frame.size.width/lightCount;
    for (int i=0; i<lightCount; i++)
    {
        float x = i*offset+offset/2;
        float y = LIGHT_HEIGHT/2;
        DebugLog(@"(x=%f,y=%f)", x,y);
        
        UIButton *lightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [lightBtn setBackgroundImage:lightImg forState:UIControlStateNormal];
        lightBtn.center= CGPointMake(x, y);
        lightBtn.frame = CGRectMake(lightBtn.frame.origin.x, self.frame.origin.y,
                                        LIGHT_WIDTH, LIGHT_HEIGHT);
        [lightBtn addTarget:self
                     action:@selector(doButtonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:lightBtn];
        
        if (isShowNumber)
        {
            [lightBtn setTitle:[NSString stringWithFormat:@"%d", i+1]
                      forState:UIControlStateNormal];
            [lightBtn setTitleColor:[UIColor blackColor]
                           forState:UIControlStateNormal];
        }
    }
}

#pragma mark -
#pragma mark - Clicked Action
- (void) doButtonClicked:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(view:ClickedIndex:)])
    {
        NSLog(@"sdjfisdjfisji");
        [delegate view:self ClickedIndex:0];
    }
}
@end
