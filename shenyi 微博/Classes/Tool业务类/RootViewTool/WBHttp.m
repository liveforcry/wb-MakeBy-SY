//
//  WBHttp.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/12.
//  Copyright © 2015年 apple-jd30. All rights reserved.


#import "WBHttp.h"
#import "AFNetworking.h"
@implementation WBHttp
+(void )GET:(NSString *)URLString
  parameters:(id)parameters
    success:(void (^)( id responseObject))success
    failure:(void (^)( NSError *error))failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void )Post:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)( id responseObject))success
     failure:(void (^)( NSError *error))failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)Upload : (NSString *)URLString
    parameters:(id)parameters
  uploadParam : (WBUploadParam *)upload
       success:(void (^)())success
       failure:(void (^)( NSError *error))failure{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //用于上传文件用的方法
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
    [formData appendPartWithFileData:upload.UploadData name:upload.UploadName fileName:upload.UploadFileName mimeType:upload.UploadMimeType];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success();
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            failure(error);
        }
    }];

}
@end
