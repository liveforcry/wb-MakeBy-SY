//
//  WBCover.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBCover.h"

@implementation WBCover

// 设置浅灰色蒙板
- (void)setDimBackground:(BOOL)dimBackground
{
_dimBackground = dimBackground;

if (dimBackground) {
    
    self.backgroundColor = [UIColor yellowColor];
    self.alpha = 0.5;
}else{
    self.alpha = 1;
    self.backgroundColor = [UIColor clearColor];
}
}

//显示蒙版
+(instancetype)showCover{
    WBCover *cover = [[WBCover alloc]initWithFrame:CGRectMake(0, 0, KWindowW, KWindowH)];
    cover.backgroundColor = [UIColor clearColor];
    
    [KKeyWindow addSubview:cover];
    
    return cover;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //移除蒙版
    [self removeFromSuperview];
    //预防式
    if ([self.delegate respondsToSelector:@selector(clickCover:)]) {
        [self.delegate clickCover:self];
    }
}
@end
