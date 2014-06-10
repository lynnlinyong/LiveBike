//
//  NumberRule.m
//  LiveBike
//
//  Created by Lynn on 14-5-19.
//  Copyright (c) 2014年 Lynn. All rights reserved.
//

#import "NumberRule.h"

#define MinDefaultNumber  25
#define MaxDefaultNumber  225
#define DefaultDValue     5
#define CurrentValue      @"CurrentValue"

@implementation NumberRule
@synthesize startNumber;
@synthesize endNumber;
@synthesize dValue;
@synthesize ruleType;

- (id)initWithFrame:(CGRect)frame withType:(RuleType) type
{
    self = [super initWithFrame:frame];
    if (self) {        
        startNumber = MinDefaultNumber;
        endNumber   = MaxDefaultNumber;
        dValue      = DefaultDValue;
        
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator   = NO;
        
        ruleType = type;
    }
    return self;
}

- (void) initUI
{
    switch (ruleType)
    {
        case kWeightType:
        {
            int contentWidth = 0;
            int dCalValue = endNumber - startNumber;
            for (int i=0; i<dCalValue/dValue; i++)
            {
                UIImage *spliteImg = [UIImage imageNamed:@"splite"];
                UIImageView *ruleImgView = [[UIImageView alloc]initWithImage:spliteImg];
                ruleImgView.frame = CGRectMake(self.frame.size.width/2+i*spliteImg.size.width, 0, spliteImg.size.width, spliteImg.size.height);
                [self addSubview:ruleImgView];
                
                UILabel *valueLab = [[UILabel alloc]init];
                valueLab.textAlignment = NSTextAlignmentCenter;
                valueLab.backgroundColor = [UIColor clearColor];
                valueLab.textColor = [UIColor grayColor];
                valueLab.frame = CGRectMake(self.frame.size.width/2+(i+1)*spliteImg.size.width-100/2, spliteImg.size.height+10, 100, 20);
                valueLab.text  = [NSString stringWithFormat:@"%d", (int)(startNumber+(i+1)*dValue)];
                [self addSubview:valueLab];
                
                contentWidth = self.frame.size.width/2+(i+1)*spliteImg.size.width;
                
            }
            self.contentSize = CGSizeMake(contentWidth+self.frame.size.width/2, self.frame.size.height);
            DebugLog(@"width:%f,height:%f", self.contentSize.width,self.contentSize.height);
            
            //显示默认值
            [self showDefaultWeightValue:70];
            break;
        }
        case kHeightType:
        {
            float contentHeight = 0;
            float dCalValue = fabsf(endNumber - startNumber);
            for (float i=0; i<dCalValue/dValue; i++)
            {
                UIImage *spliteImg = [UIImage imageNamed:@"hSplite"];
                UIImageView *ruleImgView = [[UIImageView alloc]initWithImage:spliteImg];
                ruleImgView.frame = CGRectMake(self.frame.size.width-spliteImg.size.width, self.frame.size.height/2+i*spliteImg.size.height, spliteImg.size.width, spliteImg.size.height);
                [self addSubview:ruleImgView];
                
                UILabel *valueLab = [[UILabel alloc]init];
                valueLab.textAlignment = NSTextAlignmentCenter;
                valueLab.backgroundColor = [UIColor clearColor];
                valueLab.textColor = [UIColor grayColor];
                valueLab.frame = CGRectMake(0, self.frame.size.height/2+(i+1)*spliteImg.size.height-20/2, 50, 20);
                valueLab.text  = [NSString stringWithFormat:@"%.2f", startNumber-(i+1)*dValue];
                [self addSubview:valueLab];
                
                contentHeight = self.frame.size.height/2+(i+1)*spliteImg.size.height;
                
            }
            self.contentSize = CGSizeMake(self.frame.size.width, contentHeight+self.frame.size.height/2);
            DebugLog(@"width:%f,height:%f", self.contentSize.width,self.contentSize.height);
            
            //显示默认值
            [self showDefaultHeightValue:1.70];
            break;
        }
        case kBirthType:
        {
            int contentWidth = 0;
            int dCalValue = endNumber - startNumber;
            for (int i=0; i<dCalValue/dValue; i++)
            {
                UIImage *spliteImg = [UIImage imageNamed:@"splite"];
                UIImageView *ruleImgView = [[UIImageView alloc]initWithImage:spliteImg];
                ruleImgView.frame = CGRectMake(self.frame.size.width/2+i*spliteImg.size.width, 0, spliteImg.size.width, spliteImg.size.height);
                [self addSubview:ruleImgView];
                
                UILabel *valueLab = [[UILabel alloc]init];
                valueLab.textAlignment = NSTextAlignmentCenter;
                valueLab.backgroundColor = [UIColor clearColor];
                valueLab.textColor = [UIColor grayColor];
                valueLab.frame = CGRectMake(self.frame.size.width/2+(i+1)*spliteImg.size.width-100/2, spliteImg.size.height+10, 100, 20);
                valueLab.text  = [NSString stringWithFormat:@"%d", (int)(startNumber+(i+1)*dValue)];
                [self addSubview:valueLab];
                
                contentWidth = self.frame.size.width/2+(i+1)*spliteImg.size.width;
                
            }
            self.contentSize = CGSizeMake(contentWidth+self.frame.size.width/2, self.frame.size.height);
            DebugLog(@"width:%f,height:%f", self.contentSize.width,self.contentSize.height);
            
            //显示默认值
            [self showDefaultBirthValue:1980];
            break;
        }
        default:
            break;
    }
}

- (void) showDefaultHeightValue:(float) defaultValue
{
    //计算目标值的偏移量
    float value    = startNumber - defaultValue;
    float offset = self.frame.size.height/2+value*1734/1.70;
    
    //最少偏移量
    float rectLeft = offset-self.frame.size.height/2;
    [self scrollRectToVisible:CGRectMake(0, rectLeft, self.frame.size.width, self.frame.size.height) animated:NO];
}

- (void) showDefaultBirthValue:(int) defaultValue
{
    //计算目标值的偏移量
    int value    = defaultValue - startNumber;
    float offset = self.frame.size.width/2+value*816/80;
    
    //最少偏移量
    float rectLeft = offset-self.frame.size.width/2;
    
    [self scrollRectToVisible:CGRectMake(rectLeft, 0, self.frame.size.width, self.frame.size.height) animated:NO];
}

- (void) showDefaultWeightValue:(int) defaultValue
{
    //计算目标值的偏移量
    int value    = defaultValue - startNumber;
    float offset = self.frame.size.width/2+value*10.195;
    
    //最少偏移量
    float rectLeft = offset-self.frame.size.width/2;
    
    [self scrollRectToVisible:CGRectMake(rectLeft, 0, self.frame.size.width, self.frame.size.height) animated:NO];
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    switch (ruleType)
    {
        case kWeightType:
        {
            NSLog(@"offset:(%f,%f)", scrollView.contentOffset.x,scrollView.contentOffset.y);
            float offsetValue = (scrollView.contentOffset.x/10.195)+0.5;
            
            int curValue    = startNumber+(int)offsetValue;
            NSLog(@"curValue:%d", curValue);
            
            NSDictionary *userInfoDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:curValue],@"currentValue", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:CurrentValue
                                                                object:nil
                                                              userInfo:userInfoDic];
            break;
        }
        case kHeightType:
        {
            NSLog(@"offset:(%f,%f)", scrollView.contentOffset.x,scrollView.contentOffset.y);
            float offsetValue = (scrollView.contentOffset.y*1.70/1734);
            NSLog(@"offsetValue:%f", offsetValue);
            float curValue    = startNumber-offsetValue;
            NSLog(@"curValue:%.2f", curValue);
            
            NSDictionary *userInfoDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:curValue],@"currentValue", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:CurrentValue
                                                                object:nil
                                                              userInfo:userInfoDic];
            break;
        }
        case kBirthType:
        {
            NSLog(@"offset:(%f,%f)", scrollView.contentOffset.x,scrollView.contentOffset.y);
            float offsetValue = (scrollView.contentOffset.x*80/816)+0.5;
            
            int curValue    = startNumber+(int)offsetValue;
            NSLog(@"curValue:%d", curValue);
            
            NSDictionary *userInfoDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:curValue],@"currentValue", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:CurrentValue
                                                                object:nil
                                                              userInfo:userInfoDic];
            break;
        }
        default:
            break;
    }
}
@end
