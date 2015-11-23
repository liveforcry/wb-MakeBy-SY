//
//  WBText.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/20.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBText.h"
@interface WBText ()
@property(nonatomic,strong)UILabel *placeHLb;

@end


@implementation WBText

-(void)layoutSubviews{
    [super layoutSubviews];
    self.placeHLb.x = 5;
    self.placeHLb.y = 8;
    
}
- (void)setIsTextChange:(BOOL )isTextChange{
    _isTextChange = isTextChange;
    
    self.placeHLb.hidden = isTextChange;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:15];
    }
    return self;
}
-(void)setPlaceHolders:(NSString *)placeHolders{
    _placeHolders = placeHolders;
    self.placeHLb.text = _placeHolders;
    
    [self.placeHLb sizeToFit];
}
- (UILabel *)placeHLb {
	if(_placeHLb == nil) {
		_placeHLb = [[UILabel alloc] init];

        [self addSubview:_placeHLb];
	}
	return _placeHLb;
}
- (void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeHLb.font = font;
     [self.placeHLb sizeToFit];
}
@end
