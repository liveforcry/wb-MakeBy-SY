//
//  WBPopMenu.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBPopMenu.h"

@implementation WBPopMenu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setConteView:(UIView *)conteView{
    [_conteView removeFromSuperview];
    _conteView = conteView;
    _conteView.backgroundColor = [UIColor clearColor];
    [self addSubview:conteView];
}
+(instancetype)showRect : (CGRect)rect{
    WBPopMenu *menu = [[WBPopMenu alloc]initWithFrame:rect];
    menu.userInteractionEnabled = YES;
    menu.image = [UIImage imageWithStretchableName:@"popover_background"];
    menu.backgroundColor = [UIColor clearColor];
    [KKeyWindow addSubview:menu];
    return menu;
}


//隐藏弹出菜单
+(void)hide{
    for (UIView *popView in KKeyWindow.subviews) {
        if ([popView isKindOfClass:self]) {
            [popView removeFromSuperview];
        }
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat height = self.height - y - 2 * margin;
    CGFloat weight = self.width - 2 *margin;
    _conteView.frame = CGRectMake(x, y, weight, height);
}


@end
