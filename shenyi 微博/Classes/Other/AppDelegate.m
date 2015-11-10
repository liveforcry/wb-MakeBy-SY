//
//  AppDelegate.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/10/28.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "AppDelegate.h"

#import "WBOAuthViewController.h"
#import "WBAccountTool.h"
#import "WBRootView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

//偏好设置存储的好处
// 不用关心文件名
//  快速进行键值对存储
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //创建窗口
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    WBAccountTool
    //判断是否授权
    if ([WBAccountTool accout]) { //已近授权
        [WBRootView setRootViewCnotroller:_window];
    }else{
        WBOAuthViewController *OAuthvc = [[WBOAuthViewController alloc]init];
        _window.rootViewController  =OAuthvc;
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
