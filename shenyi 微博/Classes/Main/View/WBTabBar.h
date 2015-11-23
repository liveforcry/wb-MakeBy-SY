//
//  WBTabBar.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/10/30.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTabBar;

@protocol WBTabBarDelegate <NSObject>
@optional
-(void)tabBar :(WBTabBar *)tabBar didClickAtIndex :(NSInteger)index;
//点击plusButton 调用
-(void)tabBarDidClickPlusButton :(WBTabBar *)tabBar;
@end


@interface WBTabBar : UIView
@property(nonatomic,strong)NSMutableArray *Items;
@property(nonatomic,weak)id<WBTabBarDelegate> delegate;
@end
