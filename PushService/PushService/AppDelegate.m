//
//  AppDelegate.m
//  PushService
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    //推荐服务  ios8 是一个分界线 代码是不同的
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge  categories:nil];
        
        [application registerUserNotificationSettings:setting];
         
    }else{
        [application registerForRemoteNotificationTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge ];

    }
    UILocalNotification *localNoti = [UILocalNotification new];
    localNoti.alertTitle = @"alertTitle";
    localNoti.alertBody = @"alertBoby";
    //弹出通知时的提示声音 可以填写bundel文件中的声音文件名 小于30秒 localNoti.soundName
    localNoti.soundName = @"17.mp3";
    //
    //触发通知的时间  10 秒后触发
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:10];
    localNoti.fireDate = date;
//    localNoti.applicationIconBadgeNumber = 10;
    //启动本地通知服务
    [application scheduleLocalNotification:localNoti];
    //莫您器： cmd + L 锁屏
    //远程推送服务 apns---> apple - push - notification serivce
    // 流程1：  使用购买的开发者账号
    // 流程2 ： 一分给你app 另一个给你的服务器
    // 流程3：  必须真机 真机运行之后， 会通过上方代码注册推送服务 苹果公司会根据你的bundelID 和手机唯一硬件标示 给你手机推送一个 在苹果服务器的唯一标示 --deviceToken
    // 流程4： 我们需要把收到的deviceToken 发送给我们的服务器 这个需要服务器提供一个借口
 
}
//收到本地推送

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
}
//祖册推送服务失败 一般是证书不对 或者是莫您器运行

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
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
//回调方法 接受服务器传回的设备的唯一标示
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
