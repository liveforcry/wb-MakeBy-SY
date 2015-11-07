//
//  WBCover.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WBCover;
//应为要回传什么适合除掉蒙板 需要设置代理
@protocol WBCoverDelegate <NSObject>

-(void)clickCover :(WBCover *)cover;

@end

@interface WBCover : UIView
@property(nonatomic,strong)id<WBCoverDelegate> delegate;
@property(nonatomic)BOOL dimBackground;
+(instancetype)showCover;
@end
