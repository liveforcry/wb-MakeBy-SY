//
//  WBStatusModel.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/11.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBStatusModel.h"

@implementation WBStatusModel
+(NSDictionary *)objectClassInArray{
    return @{@"pic_urls":[WBPicUrlModel class]};
}
@end
@implementation WBUserModel

@end

@implementation WBPicUrlModel

@end