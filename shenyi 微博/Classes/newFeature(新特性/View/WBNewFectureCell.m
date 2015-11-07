//
//  WBNewFectureCell.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/7.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBNewFectureCell.h"

@interface WBNewFectureCell ()
@property(nonatomic,weak)UIImageView *imageView;

@end

@implementation WBNewFectureCell

- (UIImageView *)imageView {
	if(_imageView == nil) {
		UIImageView *image = [[UIImageView alloc] init];
        _imageView = image;
        [self.contentView addSubview:_imageView];
	}
	return _imageView;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
-(void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}
@end
