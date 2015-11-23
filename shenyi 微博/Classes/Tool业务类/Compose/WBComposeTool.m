//
//  WBComposeTool.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/22.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBComposeTool.h"
#import "WBHttp.h"
#import "WBcomposerParam.h"
#import "MJExtension.h"
#import "WBUploadParam.h"
@implementation WBComposeTool

+(void)composeMessage : (NSString *)message  success : (void(^)())success failure : (void(^)(NSError *error))failure{
    
    WBcomposerParam *param = [WBcomposerParam getParam];
    param.status = message;
    [WBHttp Post:@"https://api.weibo.com/2/statuses/update.json" parameters:param.keyValues success:^(id responseObject) {
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        if (error) {
             failure(error);
        }
       
    }];
    
}
+(void)composePic : (NSString *)message image: (UIImage *)image success : (void(^)())success  failure : (void(^)(NSError *error))failure{
    
    WBcomposerParam *param = [WBcomposerParam getParam];
    param.status = message;
    
    WBUploadParam *upload = [WBUploadParam new];
    upload.UploadData = UIImagePNGRepresentation(image);
    upload.UploadFileName = @"image.png";
    upload.UploadMimeType = @"image/png";
    upload.UploadName = @"pic";
    //以后如果有好多参数就包装成模型
    [WBHttp Upload:@"https://upload.api.weibo.com/2/statuses/upload.json"  parameters:param.keyValues uploadParam : upload success:^{
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
        
    }];
    
    
    
//    [WBHttp PostFile:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:message.keyValues FileData:data name:@"pic" FileName:@"img.png" mimeType:@"img/png" success:^{
//        
//        if (success) {
//            success();
//        }
//    } failure:^(NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
    
    
}











@end
