//
//  WBToolBar.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBViewModel.h"
@class WBStatusModel;
@interface WBToolBar : UIImageView

@property(nonatomic,strong)WBStatusModel *status;
@end
