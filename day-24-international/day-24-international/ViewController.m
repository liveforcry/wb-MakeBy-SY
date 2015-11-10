//
//  ViewController.m
//  day-24-international
//
//  Created by apple-jd30 on 15/11/10.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
// 三个参数 参数2 文件中的参数1 对于的值
//    _label.text = NSLocalizedStringFromTable(@"hello", @"File", nil);
    //简单宏  是自动寻找名称是 localiszable.string文件中。。。。。
    _label.text = NSLocalizedString(@"shenyi", nil);
    [UIImage imageNamed:NSLocalizedString(@"WeChatImage", nil)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
