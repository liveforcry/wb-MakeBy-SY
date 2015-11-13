//
//  WBUserTool.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBUserResult.h"
#import "WBStatusModel.h"
@interface WBUserTool : NSObject
/**
 *  读取未读的
 *
 *  @param sucess  成功回调
 *  @param failure 失败回调
 */
+(void)unReadWithSuccess : (void(^)(WBUserResult *result))sucess : (void(^)(NSError *error))failure;
/**
 *
    读取用户的信息
 *  @param sucess
 *  @param failure
 */
+(void)GetUserInformation : (void(^)(WBUserModel *result))sucess : (void(^)(NSError *error))failure;
@end
