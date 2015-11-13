//
//  WBAccountTool.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//
// 对用户的存储和读取操作
#import <Foundation/Foundation.h>
#import "WBAccout.h"
@interface WBAccountTool : NSObject


//存储用户
+(void)saveAccout : (WBAccout *)accout;
//读取用户
+(WBAccout *)accout;


+(void)accessFromCode:(NSString *)code success : (void(^)())success failure : (void(^)())failure;
@end
