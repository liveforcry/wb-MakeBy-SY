//
//  WBToolBar.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBToolBar.h"

@interface WBToolBar ()

@property(nonatomic,strong)NSMutableArray *btns;

@property(nonatomic,strong)NSMutableArray *divides;

@property(nonatomic,strong)UIButton *seteweedBtn;
@property(nonatomic,strong)UIButton *commentBtn;
@property(nonatomic,strong)UIButton *atitudeBtn;
@end




@implementation WBToolBar

- (NSMutableArray *)btns {
    if(_btns == nil) {
        _btns = [[NSMutableArray alloc] init];
    }
    return _btns;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置所有的控件
        [self setUpAllChild];
        self.image  = [UIImage imageNamed:@"timeline_card_bottom_background_highlighted"];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)setUpAllChild{
    //赞
        _atitudeBtn = [self setOneButtonWithTitle:@"赞" :[UIImage imageNamed:@"timeline_icon_unlike"]];
    
    //转发
    _seteweedBtn = [self setOneButtonWithTitle:@"转发" :[UIImage imageNamed:@"timeline_icon_retweet"]];
    
    //评论
 
   _commentBtn = [self setOneButtonWithTitle:@"评论" :[UIImage imageNamed:@"timeline_icon_comment"]];
    for (int i = 0; i < 2; i++) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:image];
        [self.divides addObject:image];
    }
}

-(UIButton *)setOneButtonWithTitle : (NSString *)title : (UIImage *)image{
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [self addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    //设置边距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self.btns addObject:btn];
   return btn;
}
- (void)setStatus:(WBStatusModel *)status{
    _status =status;
    //设置赞
    [self setItem:_atitudeBtn :status.attitudes_count];
    //设置转发
    [self setItem:_seteweedBtn :status.reposts_count];
    //设置评论
    [self setItem:_commentBtn :status.comments_count];
    
}
- (void) setItem : (UIButton *)button  : (NSInteger)status{
    NSString *title = nil;
    //设置转发数
    if (status) {
        if (status > 10000) {
            CGFloat num = status / 10000.0;
            title = [NSString stringWithFormat:@"%.1lf万", num];
            //把 .0替换空字符
            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@" "];
        }else{
            title = [NSString stringWithFormat:@"%ld",status];
        }
         [button setTitle:title forState:UIControlStateNormal];
    }
   
}
- (void)layoutSubviews{
    [super layoutSubviews];
    NSInteger count = self.btns.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = KScreenW / count ;
    CGFloat h = self.height;
    for (int i = 0; i < count; i++) {
        UIButton *button = self.btns[i];
        x = i * w;
        button.frame = CGRectMake(x, y, w, h);
    }
    int i = 1;
    for (UIImageView *p in self.divides) {
        UIButton *btn = self.btns[i];
        p.x = btn.x;
        
        i++;
    }
    
}





- (NSMutableArray *)divides {
	if(_divides == nil) {
		_divides = [[NSMutableArray alloc] init];
	}
	return _divides;
}

@end
