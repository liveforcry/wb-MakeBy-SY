//
//  WBViewModel.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBViewModel.h"
#define  photoHW  70
@implementation WBViewModel

-(void)setStatus:(WBStatusModel *)status{
    _status = status;
    //计算原创frame

    [self setOrigonlViewFrame];
    
    //计算转发frame  有才计算
    if (status.retweeted_status) {
    [self setseteWeedViewFrame];
    }
    
    //计算工具frame
    [self settabbarViewFrame];
    
    //计算cell的高度
}
 //计算原创frame
-(void)setOrigonlViewFrame{
    // 头像
    CGFloat imageX = KStatusCellMargin;
    CGFloat imageY = imageX + 10;
    CGFloat imageWH = 35;
    _origonliconViewFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    // 昵称
    CGFloat nameX = CGRectGetMaxX(_origonliconViewFrame) + KStatusCellMargin;
    CGFloat nameY = imageY;
    CGSize nameSize = [_status.user.name sizeWithFont:KNameFont];
    _origonlnickNameLBFrame = (CGRect){{nameX,nameY},nameSize};
    
    // vip
    if (_status.user.vip) {
        CGFloat vipX = CGRectGetMaxX(_origonlnickNameLBFrame) + KStatusCellMargin;
        CGFloat vipY = nameY;
        CGFloat vipWH = 14;
        _origonlvipViewFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
        
    }
    
 
    
    // 正文
    CGFloat textX = imageX;
    CGFloat textY = CGRectGetMaxY(_origonliconViewFrame) + KStatusCellMargin;
    
    CGFloat textW = KScreenW - 2 * KStatusCellMargin;
    CGSize textSize = [_status.text sizeWithFont:KTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _origonltextLBFrame = (CGRect){{textX,textY},textSize};
    CGFloat originH = CGRectGetMaxY(_origonltextLBFrame) + KStatusCellMargin;

    NSInteger count = _status.pic_urls.count;
    //计算cgsize
    if (count) {    //原创配图
        CGFloat photrX = KStatusCellMargin;
        CGFloat photeY = CGRectGetMaxY(_origonltextLBFrame) + KStatusCellMargin;
       CGSize size =  [self setCgsize:count];
        _origonlPhtotFrame = (CGRect){{photrX,photeY},size};
        originH = CGRectGetMaxY(_origonlPhtotFrame) + KStatusCellMargin;
    }

    
    
    
    // 原创微博的frame
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = KScreenW;

    _origonlFrame = CGRectMake(originX, originY, originW, originH);

 
}

-(CGSize )setCgsize : (NSInteger)count{
    //列数
    NSInteger columnN = count ==4?2:3;
    //行数
    NSInteger rowN = (count - 1) / columnN + 1;
 
    CGFloat w = columnN * photoHW + (columnN  -1) * KStatusCellMargin;
    CGFloat h = rowN * photoHW + (rowN  -1 )* KStatusCellMargin;
    return  CGSizeMake(w, h);
    
}
//计算转发frame
-(void)setseteWeedViewFrame{
    
    //昵称
    CGFloat nameX = KStatusCellMargin;
    CGFloat nameY = KStatusCellMargin;

    CGSize nameSize = [_status.retweetedName sizeWithFont : KNameFont];
    _seteWeednickNameLBFrame = (CGRect){{nameX,nameY},nameSize};
    
    //正文
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(_seteWeednickNameLBFrame) + KStatusCellMargin;
    CGFloat textW = KWindowW - 2 * KStatusCellMargin;
    CGSize textSize = [_status.retweeted_status.text sizeWithFont:KTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _seteWeedtextLBFrame = (CGRect){{textX,textY},textSize};
     CGFloat ceteWeedH = CGRectGetMaxY(_seteWeedtextLBFrame) + KStatusCellMargin;

    NSInteger count = _status.retweeted_status.pic_urls.count;
       
    //计算cgsize
    if (count) {
        //转发配图
        
        CGFloat photrX = KStatusCellMargin;
        CGFloat photeY = CGRectGetMaxY(_seteWeedtextLBFrame) + KStatusCellMargin;
        CGSize size =  [self setCgsize:count];
        _seteWeedPhtotFrame = (CGRect){{photrX,photeY},size};
        ceteWeedH = CGRectGetMaxY(_seteWeedPhtotFrame) + KStatusCellMargin;
    }

    
    //转化微博frame
    CGFloat ceteWeedX =0;
    CGFloat ceteWeedY =CGRectGetMaxY(_origonlFrame);
    CGFloat ceteWeedW = KWindowW;
   
    _seteWeedFrame = (CGRect){{ceteWeedX,ceteWeedY},{ceteWeedW,ceteWeedH}};
}

  //计算工具frame
-(void)settabbarViewFrame{
    CGFloat tabbarX =  0;
    CGFloat tabbarY = CGRectGetMaxY(_origonlFrame);
    
    //判断有没有转发
    if (self.status.retweeted_status) {
        tabbarY = CGRectGetMaxY(_seteWeedFrame);
    }
   
    CGFloat tabbarW = KWindowW;
    CGFloat tabbarH = 35;
    
    _tabbarFrame = ((CGRect){{tabbarX,tabbarY},{tabbarW,tabbarH}});
    
    _cellTotalHeight = CGRectGetMaxY(_tabbarFrame);
    
    
}





@end
