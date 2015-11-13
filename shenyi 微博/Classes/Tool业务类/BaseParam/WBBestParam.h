//
//  WBBestParam.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface WBBestParam : NSObject<MJKeyValue>


@property(nonatomic,strong)NSString *access_token;

+(instancetype)getParam;
@end
