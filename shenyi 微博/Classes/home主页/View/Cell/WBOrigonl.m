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

@property(nonatomic,strong)WBPhotoView *photoView;

@end

@implementation WBOrigonl

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置所有的控件
        [self setUpAllChild];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"timeline_card_top_background"];
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
    _sourceLB.textColor = [UIColor lightGrayColor];
    //添加时间
    
   _timeLB = [[UILabel alloc]init];
    [self addSubview:_timeLB];
    _timeLB.font = KTimeFont;
    
    _photoView = [WBPhotoView new];
    [self addSubview:_photoView];
    
}

-(void)setViewModel:(WBViewModel *)ViewModel{
    _ViewModel = ViewModel;
    //设置frame
    [self setOrigonlFrame];

    //设置数据
    [self setOrigonlData];
}

-(void)setOrigonlFrame{
    WBStatusModel *model = _ViewModel.status;
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
    // 时间       //设置时间frame  每一次都要计算时间
    CGFloat timeX = CGRectGetMaxX(_iconView.frame) + KStatusCellMargin;
    CGFloat timeY = CGRectGetMaxY(_nickNameLB.frame) + KStatusCellMargin * 0.5;
    CGSize timeSize = [model.created_at sizeWithFont:KTimeFont];
     _timeLB.frame = (CGRect){{timeX,timeY},timeSize};
    
    // 来源   //设置来源frame
    CGFloat sourceX = CGRectGetMaxX(_timeLB.frame) + KStatusCellMargin;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [model.source sizeWithFont:KSourceFont];
     _sourceLB.frame = (CGRect){{sourceX,sourceY},sourceSize};
  
    _timeLB.textColor = [UIColor orangeColor];\
    //配图的frame
    _photoView.frame = _ViewModel.origonlPhtotFrame;
    

    
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
    
    //配图数据
    _photoView.pic_arr = _ViewModel.status.pic_urls;
    
    
}





@end
