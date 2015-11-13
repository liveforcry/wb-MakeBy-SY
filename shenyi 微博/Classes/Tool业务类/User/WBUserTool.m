//
//  WBUserTool.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBUserTool.h"
#import "WBHttp.h"
#import "WBUserParam.h"
#import "WBAccountTool.h"

#define baseUrl @"https://rm.api.weibo.com/2/remind/unread_count.json"
@implementation WBUserTool
+(void)unReadWithSuccess : (void(^)(WBUserResult *result))sucess : (void(^)(NSError *error))failure{
    WBUserParam *param = [WBUserParam getParam];
    param.uid =  [WBAccountTool accout].uid;
    [WBHttp GET:baseUrl parameters:param.keyValues success:^(id responseObject) {
      WBUserResult *reslut  =  [WBUserResult objectWithKeyValues:responseObject];
        
        if (sucess) {
               sucess(reslut);
        }
      } failure:^(NSError *error) {
          if (error) {
              failure(error);
          }
    }];
    
    
}
+(void)GetUserInformation : (void(^)(WBUserModel *result))sucess : (void(^)(NSError *error))failure{
    WBUserParam *param = [WBUserParam getParam];
    param.uid = [WBAccountTool accout].uid;
    [WBHttp GET:@"https://api.weibo.com/2/users/show.json" parameters:param.keyValues success:^(id responseObject) {
        WBUserModel *model =  [WBUserModel objectWithKeyValues:responseObject];
        if (sucess) {
        sucess(model);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}






@end
