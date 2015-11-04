//
//  WBNavigationController.m
//  shenyi weibo
//
//  Created by apple-jd30 on 15/11/4.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBNavigationController.h"

@implementation WBNavigationController
+(void)initialize{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
}
@end
