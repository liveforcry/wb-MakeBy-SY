//
//  WBNewFectureCell.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/7.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBNewFectureCell : UICollectionViewCell
@property(nonatomic,strong)UIImage *image;
//判断是否是最后一页
-(void)setIndexLastRow :(NSIndexPath *)indexPath  count :(NSInteger )count;
@end
