//
//  WBTabBarButton.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/2.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBTabBarButton.h"
#import "WBbadgeView.h"
#import "UIView+frame.h"
#define HEIGHT 0.7
@interface WBTabBarButton()
@property(nonatomic,strong)WBbadgeView *badge;
@end
@implementation WBTabBarButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置字体的颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted{
    
}
- (void)setTabBarItem:(UITabBarItem *)TabBarItem{
    _TabBarItem = TabBarItem;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    [_TabBarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
    [_TabBarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
    [_TabBarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    //添加观察者模式
    [_TabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
}
//一旦所观察的属性值发生变化 就执行下列方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self setTitle:_TabBarItem.title forState:UIControlStateNormal];
    
    [self setImage:_TabBarItem.image forState:UIControlStateNormal];
    
    [self setImage:_TabBarItem.selectedImage forState:UIControlStateSelected];
    
    self.badge.badgeValue = _TabBarItem.badgeValue;
    
}


- (WBbadgeView *)badge {
	if(_badge == nil) {
        WBbadgeView *btn = [WBbadgeView buttonWithType:0];
        [self addSubview:btn];
        _badge = btn;
	}
	return _badge;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat KW = self.bounds.size.width;
    CGFloat KH = self.bounds.size.height;
    CGFloat imageH = HEIGHT * KH;
    CGFloat imageW = KW;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = KW;
    CGFloat titleH = KH - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    

    self.badge.x = KW - self.badge.width - 10;
    self.badge.y = 0;
}

@end
