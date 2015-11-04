//
//  WBTabBarController.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/10/29.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBTabBarController.h"
#import "UIImage+WBimage.h"
#import "WBTabBar.h"
#import "WBTabBar.h"
@interface WBTabBarController ()<WBTabBarDelegate>
@property(nonatomic,strong)NSMutableArray *buttons;
@end

@implementation WBTabBarController
- (NSMutableArray *)buttons {
    if(_buttons == nil) {
        _buttons = [[NSMutableArray alloc] init];
    }
    return _buttons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    [self setUpTabBar];
}
- (void)setUpTabBar{
    WBTabBar *tabbar = [[WBTabBar alloc]initWithFrame:self.tabBar.frame];
    tabbar.backgroundColor = [UIColor whiteColor];
    //看看着点
    //    [self setValue:tabbar forKeyPath:@"tabBar"];
    [self.view addSubview:tabbar];
    tabbar.delegate = self;
    tabbar.Items = self.buttons;
    [self.tabBar removeFromSuperview];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
//+(void)initialize{
//    //获取tabbar 的外观
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    //自己导入UIKit.frameW  框架 在第一文件中招对应更改字体的设置
//    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
//
//    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
//}
#define mark TabbarDelegate
-(void)tabBar :(WBTabBar *)tabBar didClickAtIndex :(NSInteger)index{
    NSLog(@"22222222");
    self.selectedIndex = index;
}
#pragma mark 添加所有子控制器

-(void)setUpAllChildViewController{
    UIViewController *home = [UIViewController new];
    [self addOneChildViewController:home Image:[UIImage imageNamed:@"tabbar_home"] SelecteImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] Title:@"首页"];
    home.view.backgroundColor = [UIColor redColor];
    
        //消息
    UIViewController *message = [UIViewController new];
   
    [self addOneChildViewController:message Image:[UIImage imageNamed:@"tabbar_message_center"] SelecteImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] Title:@"消息"];
    message.view.backgroundColor = [UIColor yellowColor];
    
    //发现
    UIViewController *discover = [UIViewController new];
    [self addOneChildViewController:discover Image:[UIImage imageNamed:@"tabbar_discover"] SelecteImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] Title:@"发现"];
    discover.view.backgroundColor = [UIColor purpleColor];

    //我
    UIViewController *profile = [UIViewController new];
    [self addOneChildViewController:profile Image:[UIImage imageNamed:@"tabbar_profile"] SelecteImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] Title:@"我"];
    profile.view.backgroundColor = [UIColor grayColor];
;

}
#pragma  mark 添加一个子控制器
//带有中文的参数一般放在最后面 这样前面的可以提示代码
-(void)addOneChildViewController : (UIViewController *)vc Image:(UIImage *)image SelecteImage:(UIImage *)selectImage Title: (NSString *)title{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    [self.buttons addObject:vc.tabBarItem];
    [self addChildViewController:vc];

}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
