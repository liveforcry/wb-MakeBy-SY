//
//  WBUserParam.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBBestParam.h"
@interface WBUserParam : WBBestParam

//access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
//uid	true	int64	需要获取消息未读数的用户UID，必须是当前登录用户
/**
 *  需要获取消息未读数的用户UID，必须是当前登录用户
 */
@property(nonatomic,strong)NSString *uid;
@end
