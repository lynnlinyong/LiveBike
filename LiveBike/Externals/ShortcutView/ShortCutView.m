//
//  ShortCutView.m
//  LiveBike
//
//  Created by Lynn on 14-6-3.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "ShortCutView.h"

@implementation ShortCutView
@synthesize topFrame;
@synthesize midFrame;
@synthesize bottomFrame;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        topFrame    = frame;
        midFrame    = frame;
        bottomFrame = frame;
        
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                               action:@selector(panGestureAction:)];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        panGestureRecognizer.minimumNumberOfTouches = 1;
        [self addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}

#pragma mark - 
#pragma mark - Gesture Recognizer
- (void)panGestureAction:(UIPanGestureRecognizer *)recognizer
{
    CGRect old_rect;
    if( ([recognizer state] == UIGestureRecognizerStateBegan) ||
       ([recognizer state] == UIGestureRecognizerStateChanged) )
    {
        CGPoint movement = [recognizer translationInView:self];
        DebugLog(@"sdfsdfmovement.x=%f %f", [recognizer locationInView:self].x,[recognizer locationInView:self].y);
        
        old_rect = self.frame;
        old_rect.size.height = old_rect.size.height + movement.y;
        self.frame    = old_rect;
        [recognizer setTranslation:CGPointZero inView:self];
        
        if (i==0)
        {
            point = [recognizer locationInView:self];
        }
       i++;
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        NSLog(@"Gesture State End");
        DebugLog(@"Gesture State End =%f %f", [recognizer locationInView:self].x,[recognizer locationInView:self].y);
        endPoint = [recognizer locationInView:self];
        i = 0;
        DebugLog(@"offset:%f", endPoint.x-point.x);
        if ((endPoint.x-point.x)>40)
        {
            NSDictionary *userDic = [NSDictionary dictionaryWithObjectsAndKeys:@"LeftDirection",@"Direction",nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SwipDirectionNotice"
                                                                object:self
                                                              userInfo:userDic];
        }
        else if ((endPoint.x-point.x)<-40)
        {
            NSDictionary *userDic = [NSDictionary dictionaryWithObjectsAndKeys:@"RightDirection",@"Direction",nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SwipDirectionNotice"
                                                                object:self
                                                              userInfo:userDic];
        }
        
        CGRect newRect  = self.frame;
        if ((newRect.size.height<self.topFrame.size.height) || ((newRect.size.height>=self.topFrame.size.height)&&
                                                                (newRect.size.height<self.midFrame.size.height)))
        {
            if (delegate && [delegate respondsToSelector:@selector(view:statues:)])
            {
                [delegate view:self statues:kViewTopStatus];
            }
            newRect = self.topFrame;
        }
        else if ((newRect.size.height>=self.midFrame.size.height) &&
                (newRect.size.height<self.bottomFrame.size.height))
        {
            if (delegate && [delegate respondsToSelector:@selector(view:statues:)])
            {
                [delegate view:self statues:kViewMidStatus];
            }
            newRect = self.midFrame;
        }
        else
        {
            if (delegate && [delegate respondsToSelector:@selector(view:statues:)])
            {
                [delegate view:self statues:kViewBottomStatus];
            }
            newRect = self.bottomFrame;
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = newRect;
        }];
    }
}
@end
