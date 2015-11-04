//
//  WBTabBar.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/10/30.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBTabBar.h"
#import "WBTabBarButton.h"
@interface WBTabBar()
@property(nonatomic,strong)NSMutableArray *buttons;
@property(nonatomic,strong)UIButton *selectButton;
@property(nonatomic,strong)UIButton *plusBtn;
//@property(nonatomic,strong)WBTabBarButton *btn;
@end


@implementation WBTabBar
-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (void)setItems:(NSMutableArray *)Items{
    _Items = Items;
    for (UITabBarItem *p in Items) {
        WBTabBarButton *btn= [[WBTabBarButton alloc]init];
        btn.TabBarItem = p;
        btn.tag = self.buttons.count;
         [btn addTarget:self action:@selector(btnClick :) forControlEvents:UIControlEventTouchDown];
        if (btn.tag == 0) {
            [self btnClick:btn];
        }
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
    
}
-(void) btnClick : (UIButton *)btn{
    _selectButton.selected = NO;
    btn.selected = YES;
    _selectButton = btn;
    if ([_delegate respondsToSelector:@selector(tabBar:didClickAtIndex:)]) {
        [_delegate tabBar:self didClickAtIndex:btn.tag];
    }
}
- (UIButton *)plusBtn{
    if (!_plusBtn) {
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [_plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        //sizeToFit 默认会根据按钮的背景图片或者image和文字计算出按钮的最合适的尺寸
        [_plusBtn sizeToFit];
        [self addSubview:_plusBtn];
    }
    return _plusBtn;
}
// 自定义tabbar 自己布局
-(void)layoutSubviews{
    //self.items.count 。表示tabbar 里面有几个控件
    //badgeValue 其实是个value 它不可以设置图片
    [super layoutSubviews];
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnW = w / (self.Items.count + 1);
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    int i = 0;
  
    for (UIView *p in self.buttons) {
            if (i == 2) {
                i++;
            }
           btnX = i * btnW;
            p.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;

    }
    self.plusBtn.center = CGPointMake(w / 2, h / 2);
}




@end
