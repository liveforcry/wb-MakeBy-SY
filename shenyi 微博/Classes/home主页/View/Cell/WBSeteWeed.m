//
//  WBSeteWeed.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBSeteWeed.h"

@interface WBSeteWeed()
@property(nonatomic,strong)UILabel *textLB;

@property(nonatomic,strong)UILabel *nickNameLB;


@end


@implementation WBSeteWeed


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置所有的控件
        [self setUpAllChild];
    }
    return self;
}

-(void)setUpAllChild{

    //添加正文
    
    _textLB = [[UILabel alloc]init];
    [self addSubview:_textLB];
    
    //添加昵称
    
    _nickNameLB = [[UILabel alloc]init];
    [self addSubview:_nickNameLB];

    
}

@end
