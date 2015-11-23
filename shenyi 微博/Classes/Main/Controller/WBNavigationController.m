//
//  WBNavigationController.m
//  shenyi weibo
//
//  Created by apple-jd30 on 15/11/4.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBNavigationController.h"
#import "UIBarButtonItem+WBItem.h"

@interface WBNavigationController()<UINavigationControllerDelegate>
@property(nonatomic,strong)id popDelegate;
@end

@implementation WBNavigationController
+(void)initialize{
    //获取当前类的的uibarbuttonItem
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];

    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    NSLog(@"%s", __func__);
    //设置非根控制器的内容
    if (self.viewControllers.count != 0) {
        //如果把导航栏上的返回按钮覆盖掉了， 那么系统自带的滑动功能就没有了
        //设置导航栏左边的按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_back"] HeightLight:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backPre) ControlEvents:UIControlEventTouchUpInside];
        //设置导航栏右边的按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_more"] HeightLight:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(backRoot) ControlEvents:UIControlEventTouchUpInside];
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark uiNavigationDelegate
//导航控制器即将显示新的控制器的时候调用这个方法
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //获取主窗口
    UIWindow *keywindow =  [UIApplication sharedApplication].keyWindow;
    UITabBarController *conTabBar=  (UITabBarController *)keywindow.rootViewController;
    for (UIView *p in conTabBar.tabBar.subviews) {
        if ([p isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [p removeFromSuperview];
        }
    }

}
//导航调转完成的时候就会调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
  
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
        //获取主窗口
        UIWindow *keywindow =  [UIApplication sharedApplication].keyWindow;
       UITabBarController *conTabBar=  (UITabBarController *)keywindow.rootViewController;
        for (UIView *p in conTabBar.tabBar.subviews) {
            if ([p isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [p removeFromSuperview];
            }
        }
    }else{ //不是跟控制器
         self.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //我们导航控制器有代理
    self.delegate = self;
    //当前代理可以知道我们返回到那个控制器上
    //把滑动代理协议清空就可以 是实现系统自带的滑动返回功能
    _popDelegate = self.interactivePopGestureRecognizer.delegate ;
   
}
-(void)backPre{
    [self popViewControllerAnimated:YES];
}
-(void)backRoot{
    [self popToRootViewControllerAnimated:YES];
}
@end
