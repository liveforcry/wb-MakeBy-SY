//
//  AppDelegate.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/10/28.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "AppDelegate.h"
#import "WBTabBarController.h"
#import "WBNewFectureController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
#define  WBversionKey @"version"
//偏好设置存储的好处
// 不用关心文件名
//  快速进行键值对存储
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //创建窗口
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //获取当前的版本号
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    //从偏好设置里面取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:WBversionKey];
    
    //判断是否有新版本
    //如果系统有新版本好就运行新特性
    if (![currentVersion isEqualToString:lastVersion]) {
        WBNewFectureController *newFecture = [[WBNewFectureController alloc]init];
          _window.rootViewController = newFecture;
        //保存当前的版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:WBversionKey];
    }else{
//         创建tabbar
            WBTabBarController *tabbar = [[WBTabBarController alloc]init];
            _window.rootViewController = tabbar;
    }

    
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
