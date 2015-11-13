//
//  WBAccountTool.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccout.h"
#import "AFNetworking.h"
#import "WBHttp.h"
#import "WBAccountParam.h"
@implementation WBAccountTool


#define WBAccoutFileName  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"account.data"]
static   WBAccout *_accout;
//存储用户
+(void)saveAccout : (WBAccout *)accout{
   
     [NSKeyedArchiver  archiveRootObject:accout toFile:WBAccoutFileName];
}
//读取用户
+(WBAccout *)accout{
   
    //这样就是要每一次就要去 因次 我们要采用懒加载
    if (_accout == nil) {
        _accout = [NSKeyedUnarchiver unarchiveObjectWithFile:WBAccoutFileName];
    }
    if ([[NSDate date] compare:_accout.expires_data] != NSOrderedAscending )  {
        return nil;
    }
   return _accout;
}

+(void)accessFromCode:(NSString *)code success : (void(^)())success failure : (void(^)())failure{
     WBAccountParam *param = [WBAccountParam new];
    param.client_id  =  @"2633698939";
    param.client_secret = @"b7ee44a88eda261e01043526c5c87981";
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri =@"https://www.baidu.com";
    [WBHttp Post:@"https://api.weibo.com/oauth2/access_token" parameters:param.keyValues success:^(id responseObject) {
        //字典 转模型
        WBAccout *accout = [WBAccout accountWithDic:responseObject];
        //        保持用户登入信息
        [ WBAccountTool  saveAccout:accout];
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure();
        }
    }];

        //应为每一次获取到的access_token数据是一样的 所以我门 可以保持用户登入信息
 
        //会保持 应为把一个模型 规档 要遵守nscoding 协议


    
}


















@end
