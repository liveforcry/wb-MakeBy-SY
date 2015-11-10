//
//  WBRootView.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBRootView.h"
#import "WBTabBarController.h"
#import "WBNewFectureController.h"
@implementation WBRootView
#define  WBversionKey @"version"

+(void)setRootViewCnotroller : (UIWindow *)window{
    //获取当前的版本号
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    //从偏好设置里面取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:WBversionKey];
    
    //判断是否有新版本
    //如果系统有新版本好就运行新特性
    if (![currentVersion isEqualToString:lastVersion]) {
        WBNewFectureController *newFecture = [[WBNewFectureController alloc]init];
        window.rootViewController = newFecture;
        //保存当前的版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:WBversionKey];
    }else{
        //         创建tabbar
        WBTabBarController *tabbar = [[WBTabBarController alloc]init];
        window.rootViewController = tabbar;
    }
    
    
}

@end
