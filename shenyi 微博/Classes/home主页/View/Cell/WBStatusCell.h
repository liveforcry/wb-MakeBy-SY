//
//  WBStatusCell.h
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/13.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WBViewModel.h"
@interface WBStatusCell : UITableViewCell

@property(nonatomic,strong)WBViewModel *statusViewModel;



+(instancetype)getCellFromTabel :(UITableView *)tableview;

@end
