//
//  WBUploadParam.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/22.
//  Copyright © 2015年 apple-jd30. All rights reserved.
// 上传参数模型

#import <Foundation/Foundation.h>

@interface WBUploadParam : NSObject
//FileData:data name:@"pic" FileName:@"img.png" mimeType:@"img/png"
/**
 *  上传的二进制数据文件
 */
@property(nonatomic,strong)NSData *UploadData;
/**
 *  上传的参数名称
 */
@property(nonatomic,strong)NSString *UploadName;
/**
 *  上传的服务器的文件名称
 */
@property(nonatomic,strong)NSString *UploadFileName;
/**
 *  上传文件的类型
 */
@property(nonatomic,strong)NSString *UploadMimeType;


@end
