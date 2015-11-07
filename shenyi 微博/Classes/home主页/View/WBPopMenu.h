//
//  WBPopMenu.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBPopMenu : UIImageView

//  弹出菜单
+(instancetype)showRect : (CGRect)rect;


//隐藏弹出菜单
+(void)hide;
@property(nonatomic,strong)UIView *conteView;
@end
