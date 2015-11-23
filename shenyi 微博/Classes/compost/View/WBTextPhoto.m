//
//  WBTextPhoto.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/21.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBTextPhoto.h"

@implementation WBTextPhoto

-(void)setImage:(UIImage *)image{
    _image = image;
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [self addSubview:imageView];
    
}
//没添加一个子控件的适合就会调用 特殊如果在ViewDidLoad添加子控件 就不会调用
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    NSInteger cols = 3;
    NSInteger col = 0;
    NSInteger row = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    CGFloat margin  = 10;
    for (int i = 0; i < self.subviews.count; i++) {
        UIImageView *image = self.subviews[i];
        row = i / cols;
        col = i % cols;
        w = (self.width -  (cols - 1) * margin) / cols;
        h = w;

        x = (w + margin) * col;
        y  = (h  + margin) * row;
        image.frame = CGRectMake(x, y, w, h);
    }
    
}
@end
