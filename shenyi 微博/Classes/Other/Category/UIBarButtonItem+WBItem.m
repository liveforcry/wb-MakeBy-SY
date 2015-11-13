//
//  UIBarButtonItem+WBItem.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "UIBarButtonItem+WBItem.h"

@implementation UIBarButtonItem (WBItem)
+(UIBarButtonItem *)initWithImage:(UIImage *)image HeightLight : (UIImage *)hImage  target : (id )target action : (SEL)sel ControlEvents :(UIControlEvents)controlEvents{
    
    UIButton *button = [UIButton buttonWithType:0];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:hImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:sel forControlEvents:controlEvents];
  
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
