//
//  WBAccountParam.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface WBAccountParam : NSObject<MJKeyValue>
//client_id	true	string	申请应用时分配的AppKey。
//client_secret	true	string	申请应用时分配的AppSecret。
//grant_type	true	string	请求的类型，填写authorization_code
//
//grant_type为authorization_code时
//必选	类型及范围	说明
//code	true	string	调用authorize获得的code值。
//redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
/**
 *  AppKey
 */
@property(nonatomic,strong)NSString *client_id;
/**
 *  AppSecret
 */
@property(nonatomic,strong)NSString *client_secret;
/**
 * 请求的类型，填写authorization_code
 */
@property(nonatomic,strong)NSString *grant_type;
/**
 *  调用authorize获得的code值
 */
@property(nonatomic,strong)NSString *code;
/**
 *  	回调地址
 */
@property(nonatomic,strong)NSString *redirect_uri;
@end
