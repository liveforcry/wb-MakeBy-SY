//
//  WBAccout.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBAccout : NSObject<NSCoding>
/**
 *  获取数据的访问命令拍
 */
@property(nonatomic,strong)NSString *access_token;
/**
 *  过期时间  = 当前时间  + 有效期
 */
@property(nonatomic,strong)NSDate *expires_data;
/**
 *  账号的有效期
 */
@property(nonatomic,strong)NSString *expires_in;
/**
 *账号的有效期
 */
@property(nonatomic,strong)NSString *remind_in;
/**
 *  用户唯一标识符
 */
@property(nonatomic,strong)NSString *uid;
/**
 *  用户的名字
 */
@property(nonatomic,strong)NSString *name;

+(instancetype)accountWithDic :(NSDictionary *)dict;
@end
