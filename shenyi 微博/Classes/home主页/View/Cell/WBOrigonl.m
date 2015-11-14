//
//  WBOrigonl.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBOrigonl.h"
#import "UIImageView+WebCache.h"
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
    _textLB.font = KTextFont;
    //添加昵称
    _textLB.numberOfLines = 0;
    _nickNameLB = [[UILabel alloc]init];
    [self addSubview:_nickNameLB];
    _nickNameLB.font = KNameFont;
    //添加vip
    
    _vipView = [[UIImageView alloc]init];
    [self addSubview:_vipView];
    
    //添加来源
    
    _sourceLB = [[UILabel alloc]init];
    [self addSubview:_sourceLB];
    _sourceLB.font = KSourceFont;
    //添加时间
    
   _timeLB = [[UILabel alloc]init];
    [self addSubview:_timeLB];
    _timeLB.font = KTimeFont;
    
}

-(void)setViewModel:(WBViewModel *)ViewModel{
    _ViewModel = ViewModel;
    //设置frame
    [self setOrigonlFrame];
    //设置数据
    [self setOrigonlData];
}

-(void)setOrigonlFrame{
    
    //设置头像frame
    _iconView.frame = [_ViewModel origonliconViewFrame];
     //设置正文frame
    
    _textLB.frame = [ _ViewModel origonltextLBFrame];
     //设置昵称frame
    _nickNameLB.frame = [_ViewModel origonlnickNameLBFrame];
     //设置Vipframe
    if (_ViewModel.status.user.vip) {
        _vipView.hidden = NO;
        _vipView.frame = [_ViewModel origonlvipViewFrame];
        _nickNameLB.textColor = [UIColor orangeColor];
    }else{
        _vipView.hidden = YES;
              _textLB.textColor = [UIColor blackColor];
    }
     //设置来源frame
    _sourceLB.frame = [_ViewModel origonlsourceLBFrame];
     //设置时间frame
    _timeLB.frame = [_ViewModel origonltimeLBFrame];
    _timeLB.textColor = [UIColor orangeColor];
}

-(void)setOrigonlData{
    //设置头像
    [_iconView sd_setImageWithURL:_ViewModel.status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    //设置昵称
    _nickNameLB.text = _ViewModel.status.user.name;
    
    //设置正文
    _textLB.text = _ViewModel.status.text;
    
    //设置vip
    
    NSString *vipLevel = [NSString stringWithFormat:@"common_icon_membership_level%ld",_ViewModel.status.user.mbrank];
    _vipView.image = [UIImage imageNamed:vipLevel];
    
    //设置来源
    _sourceLB.text = _ViewModel.status.source;
    //设置时间
    
    _timeLB.text = _ViewModel.status.created_at;
    
}





@end
