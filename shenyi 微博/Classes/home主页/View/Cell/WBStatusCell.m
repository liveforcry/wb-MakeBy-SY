//
//  WBStatusCell.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBStatusCell.h"
#import "WBOrigonl.h"
#import "WBSeteWeed.h"
#import "WBTabbar.h"

@interface WBStatusCell ()
@property(nonatomic,strong)WBOrigonl *origionl;
@property(nonatomic,strong)WBSeteWeed *seteWeed;
@property(nonatomic,strong)WBTabbar  *tabbar;
@end
@implementation WBStatusCell
//等一下要给三个子视图赋值 所有要得到应用


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置所有的控件
        [self setUpAllChild];
    }
    return self;
}
//设置所有的控件

-(void)setUpAllChild{
    //设置原创
    _origionl = [[WBOrigonl alloc]init];
    [self.contentView addSubview:_origionl];
    
    //设置转发
    _seteWeed = [[WBSeteWeed alloc]init];
    [self.contentView addSubview:_seteWeed];
    
    //设置tabbar
    
   _tabbar = [[WBTabbar alloc]init];
    [self.contentView addSubview:_tabbar];
    
}

















@end
