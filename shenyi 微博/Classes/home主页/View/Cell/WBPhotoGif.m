//
//  WBPhotoGif.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/20.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBPhotoGif.h"
#import "UIImageView+WebCache.h"
@interface WBPhotoGif()
@property(nonatomic,strong)UIImageView *gifImage;

@end
@implementation WBPhotoGif

 -(instancetype)initWithFrame:(CGRect)frame{
        if (self = [super initWithFrame:frame]) {
            
            self.userInteractionEnabled = YES;
            self.contentMode = UIViewContentModeScaleAspectFill;
           
            self.clipsToBounds = YES;
            
           _gifImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
            [self addSubview:_gifImage];

        }
        return self;
    }
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _gifImage.x = self.width - _gifImage.width;
    _gifImage.y = self.height - _gifImage.height;
}

-(void)setPicUrl:(WBPicUrlModel *)picUrl{
    _picUrl = picUrl;
    
   [self sd_setImageWithURL:_picUrl.thumbnail_pic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    //是否有gif
    
    NSString *url = _picUrl.thumbnail_pic.absoluteString;
    
    if ([url hasSuffix:@".gif"]) {
        self.gifImage.hidden = NO;
    }else{
        self.gifImage.hidden = YES;
    }
}



@end
