//
//  WBbadgeView.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/2.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBbadgeView.h"

#import "UIView+frame.h"
@implementation WBbadgeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {

    self.userInteractionEnabled = NO;
    [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    [self sizeToFit];
    }
    return self;
}
-(void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    if ([badgeValue isEqualToString:@"0"] || badgeValue.length == 0) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    CGSize size = [badgeValue sizeWithFont:[UIFont systemFontOfSize:11]];
    if (size.width > self.width) {
        [self setTitle:nil forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
    }
}
@end
