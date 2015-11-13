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
    self.imageView.x = 0;
    self.titleLabel.x =  self.imageView.x;
 
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);

}
- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}
@end
