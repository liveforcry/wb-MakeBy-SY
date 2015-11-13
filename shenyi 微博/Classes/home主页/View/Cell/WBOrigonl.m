//
//  WBOrigonl.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBOrigonl.h"
@interface WBOrigonl()
@property(nonatomic,strong)UILabel *textLB;

@property(nonatomic,strong)UILabel *nickNameLB;

@property(nonatomic,strong)UILabel *sourceLB;

@property(nonatomic,strong)UILabel *timeLB;

@property(nonatomic,strong)UIImageView *iconView;

@property(nonatomic,strong)UIImageView *vipView;

@end

@implementation WBOrigonl

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置所有的控件
        [self setUpAllChild];
    }
    return self;
}

-(void)setUpAllChild{
    
    //添加头像
    _iconView = [[UIImageView alloc]init];
    [self addSubview:_iconView];
    //添加正文
    
    _textLB = [[UILabel alloc]init];
    [self addSubview:_textLB];
    
    //添加昵称
    
    _nickNameLB = [[UILabel alloc]init];
    [self addSubview:_nickNameLB];
    //添加vip
    
    _vipView = [[UIImageView alloc]init];
    [self addSubview:_vipView];
    //添加来源
    
    _sourceLB = [[UILabel alloc]init];
    [self addSubview:_sourceLB];
    
    //添加时间
    
   _timeLB = [[UILabel alloc]init];
    [self addSubview:_timeLB];
}











@end
