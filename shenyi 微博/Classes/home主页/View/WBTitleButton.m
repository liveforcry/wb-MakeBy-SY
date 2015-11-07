//
//  WBTitleButton.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/5.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBTitleButton.h"

@implementation WBTitleButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     
        [self setBackgroundImage:[UIImage imageWithStretchableName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        
    }
    return self;
   
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.currentImage == nil) {
        return;
    }
    self.titleLabel.x = self.imageView.x;
//    NSLog(@"image.x = %f", self.titleLabel.x);
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
//    NSLog(@"cgrect.x = %f",CGRectGetMaxX(self.titleLabel.frame));
}
- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}
-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    [super setTitleColor:color forState:state];
    [self sizeToFit];
}
@end
