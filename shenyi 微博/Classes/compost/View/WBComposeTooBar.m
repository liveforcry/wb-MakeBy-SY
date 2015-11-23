//
//  WBComposeTooBar.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/20.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBComposeTooBar.h"
@interface WBComposeTooBar()


@end


@implementation WBComposeTooBar
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setAllButton];
    }
    return self;
}
-(void)setAllButton{
    //设置相册
    [self setUpOneButtonWithImage:[UIImage imageNamed:@"compose_toolbar_picture"] HeightLight:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(photoAlbum:)];
    
    //设置@ 提及
    [self setUpOneButtonWithImage:[UIImage imageNamed:@"compose_mentionbutton_background"] HeightLight:[UIImage imageNamed:@"compose_mentionbutton_background_highlighted"] target:self action:@selector(infroWith:)];
    
    //设置  话题
    [self setUpOneButtonWithImage:[UIImage imageNamed:@"compose_trendbutton_background"] HeightLight:[UIImage imageNamed:@"compose_trendbutton_background_highlighted"] target:self action:@selector(hotItems:)];
    
    //设置 表情
    
    [self setUpOneButtonWithImage:[UIImage imageNamed:@"compose_emoticonbutton_background"] HeightLight:[UIImage imageNamed:@"compose_emoticonbutton_background_highlighted"] target:self action:@selector(emotions:)];
    //设置 键盘
    
    [self setUpOneButtonWithImage:[UIImage imageNamed:@"compose_keyboardbutton_background"] HeightLight:[UIImage imageNamed:@"compose_keyboardbutton_background_highlighted"] target:self action:@selector(keyBoard:)];
}


-(void )setUpOneButtonWithImage:(UIImage *)image HeightLight : (UIImage *)hImage  target : (id )target action : (SEL)sel {
    
    UIButton *button = [UIButton buttonWithType:0];
    button.tag = self.subviews.count;
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:hImage forState:UIControlStateHighlighted];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}
//设置相册
-(void)photoAlbum: (UIButton *)btn{
    
    if ([_delegate respondsToSelector:@selector(DidClickedButton:Selectindex:)]) {
        [_delegate DidClickedButton:self Selectindex:btn.tag];
    }
}

//设置@ 提及
-(void)infroWith: (UIButton *)btn{
    
    
}

//设置  话题
-(void)hotItems: (UIButton *)btn{
    
    
}

//设置 表情
-(void)emotions: (UIButton *)btn{
    
    
}
//设置 键盘

-(void)keyBoard: (UIButton *)btn{
    
    
}

-(void)layoutSubviews{
    NSInteger count = self.subviews.count ;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.width / count;
    CGFloat h = self.height;
    for (int i = 0; i < count; i++) {
         x = w * i;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, w, h);
       
    }
    
}
@end
