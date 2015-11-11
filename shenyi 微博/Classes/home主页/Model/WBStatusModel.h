//
//  WBStatusModel.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/11.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@class WBUserModel;
@interface WBStatusModel : NSObject<MJKeyValue>

@property(nonatomic,strong)NSString *created_at;
/**
 *  字符串型的微博ID
 */
@property(nonatomic,strong)NSString *idstr;
/**
 *  微博信息内容
 */
@property(nonatomic,strong)NSString *ext;
/**
 *  微博来源
 */
@property(nonatomic,strong)NSString *source;
/**
 *  转发数
 */
@property(nonatomic)NSInteger reposts_count;
/**
 *  评论数
 */
@property(nonatomic)NSInteger comments_count;
/**
 *  表态数 (赞)
 */
@property(nonatomic,)NSInteger attitudes_count;
/**
 *  图片数组(WBphoto)
 */
@property(nonatomic,strong)NSArray *pic_urls;

/**
 *  微博作者的用户信息字段 详细
 */
@property(nonatomic,strong)WBUserModel *user;
/**
 *  转化的配图
 */
@property(nonatomic,strong)WBStatusModel *retweeted_status;

@end



@interface WBUserModel :NSObject
/**
 *  微博昵称
 */
@property(nonatomic,strong)NSString *name;
/**
 *  微博头像
 */
@property(nonatomic,strong)NSURL *profile_image_url;
@end


@interface WBPicUrlModel : NSObject

@property(nonatomic,strong)NSURL *thumbnail_pic;
@end




