//
//  UIImage+WBimage.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/10/29.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "UIImage+WBimage.h"

@implementation UIImage (WBimage)
+(instancetype)imageWithOriginalName :(NSString *)imageStr{
    UIImage *image = [UIImage imageNamed:imageStr];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
+(instancetype)imageWithStretchableName:(NSString *)imageName{
    
  UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
