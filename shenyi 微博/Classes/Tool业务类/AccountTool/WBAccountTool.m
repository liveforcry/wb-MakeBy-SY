//
//  WBAccountTool.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBAccountTool.h"
#import "WBAccout.h"
@implementation WBAccountTool


#define WBAccoutFileName  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"account.data"]
static   WBAccout *_accout;
//存储用户
+(void)saveAccout : (WBAccout *)accout{
    NSLog(@"path  = %@", WBAccoutFileName);
     [NSKeyedArchiver  archiveRootObject:accout toFile:WBAccoutFileName];
}
//读取用户
+(WBAccout *)accout{
   
    //这样就是要每一次就要去 因次 我们要采用懒加载
    if (_accout == nil) {
        _accout = [NSKeyedUnarchiver unarchiveObjectWithFile:WBAccoutFileName];
    }
    if ([[NSDate date] compare:_accout.expires_data] != NSOrderedAscending )  {
        return nil;
    }
   return _accout;
}
@end
