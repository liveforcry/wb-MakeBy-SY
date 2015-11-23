//
//  WBPhotoView.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/16.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBPhotoView.h"
#import "UIImageView+WebCache.h"
#import "WBHomeViewController.h"
#import "WBStatusModel.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "WBPhotoGif.h"
@implementation WBPhotoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
            [self setUpAllChild];
    }
    return self;
}

-(void)setUpAllChild{
    
    for (int i = 0; i < 9; i++) {
        WBPhotoGif *image = [[WBPhotoGif alloc]init];
        [self addSubview:image];

        
 }
    
}

-(void)setPic_arr:(NSArray *)pic_arr{
    _pic_arr = pic_arr;
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        WBPhotoGif *image = self.subviews[i];

        image.tag = i;
 
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [image addGestureRecognizer:gesture];
        if (i < pic_arr.count) {
           image.hidden = NO;
            //赋值
      image.picUrl = pic_arr[i];

            
        }else{
         image.hidden = YES;
            
        }
    }
    
}
-(void)tap: (UIGestureRecognizer *)gesture{
//    // 所有的图片对象(MJPhoto)
//    @property (nonatomic, strong) NSArray *photos;
//    // 当前展示的图片索引
//    @property (nonatomic, assign) NSUInteger currentPhotoIndex;
    UIImageView *image = (UIImageView *)gesture.view;
  
  
    NSMutableArray *array = [NSMutableArray array];
 
    for (int i = 0; i < self.pic_arr.count; i++) {
        MJPhoto *photo = [[MJPhoto alloc]init];
        WBPicUrlModel *model = self.pic_arr[i];
        NSString *thumbnailStr = model.thumbnail_pic.absoluteString;
//        NSLog(@"thumbnailStr  =%@",thumbnailStr);
       thumbnailStr = [thumbnailStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        photo.url  = [NSURL URLWithString:thumbnailStr];
        photo.srcImageView = image;
        photo.index = i  ;
        [array addObject:photo];
    }
    
    MJPhotoBrowser *broswer = [[MJPhotoBrowser alloc]init];
    broswer.photos = array;
    broswer.currentPhotoIndex = image.tag;
    [broswer show];
    
    
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    //采用九宫格布局
    NSInteger count = self.pic_arr.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat col = 0;
    CGFloat row = 0;
    NSInteger margin = 10;
    NSInteger allCol = count ==4 ? 2 : 3;
    for (int i = 0; i < count; i++) {
        col = i % allCol;  // 当前的列数
        row = i / allCol;  // 当前的行数
        x = (margin + w)* col;
        y =(margin + h) * row;
        UIImageView *image = self.subviews[i];
        image.frame = CGRectMake(x, y, w, h);
        
    }
    
    
    
}






@end
