//
//  WBAccout.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/9.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//
#import "MJExtension.h"
#import "WBAccout.h"
#define accessTokenKey  @"token"
#define expiresInKey @"expires"
#define  uidKey  @"uid"
#define  expiresDateKey @"date"
#define  nameKey @"name"
@implementation WBAccout
+(instancetype)accountWithDic :(NSDictionary *)dict{
    WBAccout *accout = [[self alloc]init];
    [accout setValuesForKeysWithDictionary:dict];
    return accout;
}

// 实现归档时候调用  告诉系统要 把那个属性归档 怎么归档


- (void)setExpires_in:(NSString *)expires_in{
    _expires_in = expires_in;
    _expires_data = [NSDate dateWithTimeIntervalSinceNow:expires_in.longLongValue];
}

//MJCodingImplementation 一句话 把code 和 acode 来个方法都搞定
//解析  解档的时候调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:accessTokenKey]; //解完档 就要实现保存到属性中  一定要记得
       _uid = [aDecoder decodeObjectForKey:uidKey];
       _expires_in = [aDecoder decodeObjectForKey:expiresInKey];
        _expires_data = [aDecoder decodeObjectForKey:expiresDateKey];
        _name = [aDecoder decodeObjectForKey:nameKey];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    //将下面的属性归档
    [aCoder encodeObject:_access_token forKey:accessTokenKey];
    [aCoder encodeObject:_uid forKey:uidKey];
    [aCoder encodeObject:_expires_in forKey:expiresInKey];
    [aCoder encodeObject:_expires_data forKey:expiresDateKey];
    [aCoder encodeObject:_name forKey:nameKey];
}

@end







//kvc 原理：
//  1：首先 是寻找key 在模型中对于的是否具有 setkey方法 如果有就 赋值
//2  1 不成立 就寻找 _key 如果有就赋值
// 2 不成立 就寻找有没有属性key （同名）如果有就赋值
//如果找不到 对于的key 就会保错