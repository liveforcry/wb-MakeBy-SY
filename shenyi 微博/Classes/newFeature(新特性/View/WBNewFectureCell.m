//
//  WBNewFectureCell.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/7.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBNewFectureCell.h"
#import "WBTabBarController.h"
@interface WBNewFectureCell ()
@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,weak)UIButton *shareButton;
@property(nonatomic,weak)UIButton *startButton;
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
    self.shareButton.center = CGPointMake(self.width * 0.5,
                                          self.height * 0.8);
    self.startButton.center = CGPointMake(self.width * 0.5, self.height * 0.85);
    self.imageView.frame = self.bounds;
}
-(void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}
-(void)setIndexLastRow :(NSIndexPath *)indexPath  count :(NSInteger )count{
    if (indexPath.row == count - 1) {
        self.shareButton.hidden = NO;
        self.startButton.hidden = NO;
    }else{
        self.shareButton.hidden = YES;
        self.startButton.hidden = YES;
    }
}
- (UIButton *)shareButton {
	if(_shareButton == nil) {
        UIButton *btn = [UIButton buttonWithType:0];
        _shareButton = btn;
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
       
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:@"分享到微博" forState:UIControlStateNormal];
         [btn sizeToFit];
        [self.contentView addSubview:btn];
	}
	return _shareButton;
}

- (UIButton *)startButton {
	if(_startButton == nil) {
		 UIButton *btn = [UIButton buttonWithType:0];
        _startButton = btn;
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateSelected];
          [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_startButton sizeToFit];
        [btn setTitle:@"开启微博" forState:UIControlStateNormal];
         [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
	}
	return _startButton;
}
-(void)start{
    WBTabBarController *vc = [WBTabBarController new];
    WBKeyWindow.rootViewController = vc;
}
@end
