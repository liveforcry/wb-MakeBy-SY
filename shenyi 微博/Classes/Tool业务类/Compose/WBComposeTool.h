//
//  WBComposeTool.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/22.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBComposeTool : NSObject
//上传文字的
+(void)composeMessage : (NSString *)message success : (void(^)())success  failure : (void(^)(NSError *error))failure;
//上传图片的
+(void)composePic : (NSString *)message image: (UIImage *)image success : (void(^)())success  failure : (void(^)(NSError *error))failure;

@end
