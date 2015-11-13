//
//  WBStatusTool.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//  处理微博数据

#import <Foundation/Foundation.h>

@interface WBStatusTool : NSObject

/**
 *  请求更新的微博数据
 *
 *  @param sinceId     返会比他还大的id
 *  @param success   成功
 *  @param failure  失败
 */
+(void)getNewstatuesSinceId : (NSString *)sinceId
success : (void(^)(NSArray *status)) success
failure:(void(^) (NSError *error)) failure;
/**
 *  请求得到更多数据
 *
 *  @param sinceId     返会比他还大的id
 *  @param success   成功
 *  @param failure  失败
 */
+(void)getMoretatuesSinceId : (NSString *)sinceId
                    success : (void(^)(NSArray *status)) success
                    failure:(void(^) (NSError *error)) failure;
@end
