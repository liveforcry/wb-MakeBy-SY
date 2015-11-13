//
//  WBResult.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBResult.h"
#import "WBStatusModel.h"
@implementation WBResult
+(NSDictionary *)objectClassInArray{
    return @{@"statuses":[WBStatusModel class]};
}
@end
