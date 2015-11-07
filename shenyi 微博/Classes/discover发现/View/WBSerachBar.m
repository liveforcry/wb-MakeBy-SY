//
//  WBSerachBar.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/4.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBSerachBar.h"

@implementation WBSerachBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
      
        //设置左边的view
        //用到initWithImage的方法UIImageView的大小和图片一样
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
       
        imageView.width += 10;
        imageView.contentMode = UIViewContentModeCenter;
        self.leftView = imageView;
        //必须设置编辑框的模式才可显示出来 应为显示是默认不显示的
        self.leftViewMode = UITextFieldViewModeAlways;

    }
    return self;
}

@end
