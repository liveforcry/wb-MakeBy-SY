//
//  WBSeteWeed.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBSeteWeed.h"
#import "WBPhotoView.h"
@interface WBSeteWeed()
@property(nonatomic,strong)UILabel *textLB;

@property(nonatomic,strong)UILabel *nickNameLB;

@property(nonatomic,strong)WBPhotoView *photoView;
@end


@implementation WBSeteWeed


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置所有的控件
        [self setUpAllChild];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"timeline_retweet_background"];
    }
    return self;
}
-(void)setViewModel:(WBViewModel *)ViewModel{
     _ViewModel = ViewModel;
    _nickNameLB.frame = _ViewModel.seteWeednickNameLBFrame;
    _textLB.frame = _ViewModel.seteWeedtextLBFrame;
    _textLB.numberOfLines = 0;
    _nickNameLB.font = KNameFont;
    _textLB.font = KTextFont;
    //设置昵称
    _nickNameLB.text = ViewModel.status.retweetedName;
    _nickNameLB.textColor = [UIColor blueColor];
    //设置正文
    _textLB.text = _ViewModel.status.retweeted_status.text;
//    #warning TODO  配图的数据

    _photoView.frame = ViewModel.seteWeedPhtotFrame;
    _photoView.pic_arr = ViewModel.status.retweeted_status.pic_urls;
    
}
-(void)setUpAllChild{

    //添加正文
    
    _textLB = [[UILabel alloc]init];
    [self addSubview:_textLB];
    
    //添加昵称
    
    _nickNameLB = [[UILabel alloc]init];
    
    [self addSubview:_nickNameLB];
    
    //添加配图
    
    _photoView  = [[WBPhotoView alloc]init];
    [self addSubview:_photoView];
}

@end
