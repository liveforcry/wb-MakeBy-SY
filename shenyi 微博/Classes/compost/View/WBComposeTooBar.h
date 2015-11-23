//
//  WBComposeTooBar.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/20.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBComposeTooBar;

@protocol WBComposeTooBarDelegate <NSObject>

@optional
//点击了按钮 传下标
-(void)DidClickedButton : (WBComposeTooBar *)toolbar Selectindex: (NSInteger)index;

@end


@interface WBComposeTooBar : UIView

@property(nonatomic,strong)id<WBComposeTooBarDelegate> delegate;
@end
