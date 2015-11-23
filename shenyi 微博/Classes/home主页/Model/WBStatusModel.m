 //
//  WBStatusModel.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/11.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBStatusModel.h"
#import "NSDate+MJ.h"
@implementation WBStatusModel
+(NSDictionary *)objectClassInArray{
    

    return @{@"pic_urls":[WBPicUrlModel class]};
}


-(NSString *)created_at{
    
    //    Sat Nov 14 10:25:31 +0800 2015
    //判断是不是今年

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en-us"];
    NSDate *create = [fmt dateFromString:_created_at];

     if ([create isThisYear]) { //是今年
            if ([create isToday]) { //今天
                
            NSDateComponents *cmp  =  [create deltaWithNow];
                if (cmp.hour >= 1) { //大于1 小时 小于24小时
                    return  [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
                  
                }else if(cmp.minute > 1){
                    return [NSString stringWithFormat:@"%ld分钟之前", cmp.minute];
                }else{
                    
                    return @"刚刚";
                }
            }else if ([create isYesterday]){  //明天
                fmt.dateFormat = @"昨天 HH:mm";
                
                return [fmt stringFromDate:create];
                
            }else{ //2 天前
                fmt.dateFormat = @"MM-dd HH:mm";
                
                return [fmt stringFromDate:create];
            }
     }else{ //不是今年
         
       fmt.dateFormat  =@"yyyy-MM-dd HH:mm";
         
        return [fmt stringFromDate:create];
     }
    
    return _created_at;
    
}
- (void)setRetweeted_status:(WBStatusModel *)retweeted_status{
    _retweeted_status = retweeted_status;
    _retweetedName = [NSString stringWithFormat:@"@%@",_retweeted_status.user.name];
}
- (void)setSource:(NSString *)source{
   
    NSRange rang =  [source rangeOfString:@">"];
//    NSLog(@"rang = %ld", rang.location);
    source = [source substringFromIndex:rang.location + 1];
 
    rang = [source rangeOfString:@"<"];
    source= [source substringToIndex:rang.location];
     _source = source;
}
@end
@implementation WBUserModel


- (void)setMbtype:(NSInteger)mbtype
{
    _mbtype = mbtype;
    _vip = mbtype > 2;
}

@end

@implementation WBPicUrlModel

@end