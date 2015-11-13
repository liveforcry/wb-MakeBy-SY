//
//  WBStatusTool.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBStatusTool.h"
#import "WBHttp.h"
#import "WBAccountTool.h"
#import "WBStatusModel.h"
#import "WBParam.h"
#import "MJExtension.h"
#import "WBResult.h"
@implementation WBStatusTool
+(void)getNewstatuesSinceId : (NSString *)sinceId
                    success : (void(^)(NSArray *status)) success
                     failure:(void(^) (NSError *error)) failure{
    NSString *path = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    WBParam *param = [WBParam new];

    param.access_token = [WBAccountTool accout].access_token;

    if (sinceId) {
        param.since_id  = sinceId;
    }
    // param.keyCalues 是模型转字典
//
    [WBHttp GET:path parameters:param.keyValues success:^(id responseObject) {
        //请求到了数据  转化成模型
        //把status 数据插入到self.status数组中
      
         WBResult *result =  [WBResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}



+(void)getMoretatuesSinceId : (NSString *)sinceId
                    success : (void(^)(NSArray *status)) success
                     failure:(void(^) (NSError *error)) failure{
    
    NSString *path = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    WBParam *param = [WBParam new];
    if (sinceId) {
        param.max_id = sinceId;
    }
   param.access_token =[WBAccountTool accout].access_token;
    //有最新微博数据 才需要下面的新属性
    
 [WBHttp GET:path parameters:param.keyValues success:^(id responseObject) {

      WBResult *result = [WBResult objectWithKeyValues:responseObject];

     if (success) {
           success(result.statuses);
     }
   
    } failure:^(NSError *error) {
     if (failure) {
         failure(error);
     }
    }];
  
}


@end
