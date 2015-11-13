//
//  WBHttp.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//// 用于网路的请求

#import <Foundation/Foundation.h>

@interface WBHttp : NSObject
/**
 *  发送get 请求
 *
 *  @param URLString   基础url
 *  @param parameters  请求的参数字典
 *  @param success  成功回调
 *  @param failure    失败回调
 */
+(void )GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)( id responseObject))success
                        failure:(void (^)( NSError *error))failure;
/**
 *  发送post 请求
 *
 *  @param URLString   基础url
 *  @param parameters   请求的参数字典
 *  @param success  成功回调
 *  @param failure    失败回调
 */
+(void )Post:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)( id responseObject))success
    failure:(void (^)( NSError *error))failure;
@end
