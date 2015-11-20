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
#import "WBToolBar.h"
#import "WBViewModel.h"
#import "WBStatusModel.h"
@interface WBStatusCell ()
@property(nonatomic,strong)WBOrigonl *origionl;
@property(nonatomic,strong)WBSeteWeed *seteWeed;
@property(nonatomic,strong)WBToolBar  *tabbar;
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
        //因为cell 是背景色是白色 所以把cell的颜色去掉 既可以显示table 的背景色了
        self.backgroundColor = [UIColor clearColor];
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
    
   _tabbar = [[WBToolBar alloc]init];
    [self.contentView addSubview:_tabbar];
    
}
- (void)setStatusViewModel:(WBViewModel *)statusViewModel{
    _statusViewModel = statusViewModel;
    
    _origionl.frame = statusViewModel.origonlFrame;
    _origionl.ViewModel = statusViewModel;
    _seteWeed.frame = statusViewModel.seteWeedFrame;
    _seteWeed.ViewModel = statusViewModel;
    _tabbar.frame = statusViewModel.tabbarFrame;
    _tabbar.status = statusViewModel.status;
   
}

//创建cell

+(instancetype)getCellFromTabel :(UITableView *)tableview{
    id cell = [tableview dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    return cell;
    
}














@end
