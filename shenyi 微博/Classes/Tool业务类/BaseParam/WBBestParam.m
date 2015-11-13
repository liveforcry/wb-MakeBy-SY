//
//  WBBestParam.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBBestParam.h"
#import "WBAccountTool.h"
@implementation WBBestParam
+(instancetype)getParam{
    WBBestParam *param = [[self alloc]init];
    param.access_token = [WBAccountTool accout].access_token;
    return param;
}
@end
