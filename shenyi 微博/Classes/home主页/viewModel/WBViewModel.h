//
//  WBViewModel.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//  实现model 和 view frame

#import <Foundation/Foundation.h>

#import "WBStatusModel.h"

@interface WBViewModel : NSObject

/*****************来源于工具栏******************/
//tabbarframe
@property(nonatomic)CGRect tabbarFrame;

/*****************来源于原创******************/
//原创frame
@property(nonatomic)CGRect origonlFrame;
//正文frame
@property(nonatomic)CGRect origonltextLBFrame;
//昵称frame
@property(nonatomic)CGRect origonlnickNameLBFrame;
//来源frame
@property(nonatomic)CGRect origonlsourceLBFrame;
//时间frame
@property(nonatomic)CGRect origonltimeLBFrame;
//头像frame
@property(nonatomic)CGRect origonliconViewFrame;
//vipframe
@property(nonatomic)CGRect origonlvipViewFrame;
//原创配图
@property(nonatomic)CGRect origonlPhtotFrame;


/*****************来源于转发******************/
//转发frame
@property(nonatomic)CGRect seteWeedFrame;
//转发正文frame
@property(nonatomic)CGRect seteWeedtextLBFrame;
//转发昵称frame
@property(nonatomic)CGRect seteWeednickNameLBFrame;
//转发配图
@property(nonatomic)CGRect seteWeedPhtotFrame;

//
//@property(nonatomic)CGRect statusCell;

@property(nonatomic,strong)WBStatusModel *status;

//cell 的高度


@property(nonatomic)CGFloat cellTotalHeight;

@end
