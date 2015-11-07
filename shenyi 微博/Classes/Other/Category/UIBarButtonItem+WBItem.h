//
//  UIBarButtonItem+WBItem.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WBItem)
//UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] style:UIBarButtonItemStyleDone target:self action:@selector(didClickRightTitle)
//                             ];

+(UIBarButtonItem *)initWithImage:(UIImage *)image HeightLight : (UIImage *)hImage target : (id )target action : (SEL)sel ControlEvents :(UIControlEvents)controlEvents;
@end
