//
//  WBUserResult.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBUserResult.h"

@implementation WBUserResult

-(NSInteger)getMessageCount{
   return  _cmt + _dm + _mention_cmt + _mention_status;
}
-(NSInteger)getTotalCount{
    return _cmt + _dm + _mention_cmt + _mention_status + _follower + _status;
}
@end
