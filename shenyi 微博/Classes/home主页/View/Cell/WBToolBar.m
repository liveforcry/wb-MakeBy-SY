//
//  WBToolBar.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBToolBar.h"

@implementation WBToolBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置所有的控件
        [self setUpAllChild];
    self.backgroundColor = [UIColor redColor];
    }
    return self;
}
-(void)setViewModel:(WBViewModel *)ViewModel{
    _ViewModel = ViewModel;
}
-(void)setUpAllChild{
    
}
@end
