//
//  WBUserResult.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBBestParam.h"
@interface WBUserResult : WBBestParam
//status	int	新微博未读数
//follower	int	新粉丝数
//cmt	int	新评论数
//dm	int	新私信数
//mention_status	int	新提及我的微博数
//mention_cmt	int	新提及我的评论数
/**
 *新微博未读数
 */
@property(nonatomic)NSInteger status;
/**
 *  新粉丝数
 */
@property(nonatomic)NSInteger follower;
/**
 *  新评论数
 */
@property(nonatomic)NSInteger cmt;
/**
 *  新私信数
 */
@property(nonatomic)NSInteger dm;
/**
 *  新提及我的微博数
 */
@property(nonatomic)NSInteger mention_status;
/**
 *  新提及我的评论数
 */
@property(nonatomic)NSInteger mention_cmt;


/**
 *  返回在消息的总数
 */
-(NSInteger)getMessageCount;

/**
 *  返回所有的总数
 *
 *  @return
 */


-(NSInteger)getTotalCount;





@end
