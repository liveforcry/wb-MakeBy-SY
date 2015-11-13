//
//  WBOAuthViewController.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/7.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBOAuthViewController.h"
#import "MBProgressHUD+MJ.h"

#define WBOAuth
#import "WBAccout.h"
#import "WBAccountTool.h"
#import "WBRootView.h"
#import "WBAccountTool.h"

@interface WBOAuthViewController ()<UIWebViewDelegate>

@end

@implementation WBOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
   
    // URL  + 请求参数 + 参数
    NSString *baseUrl = @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id = @"2633698939";
    NSString *redirect_uri = @"https://www.baidu.com";
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate = self;
    [webView loadRequest:request];
//    https://api.weibo.com/oauth2/authorize?client_ id=2633698939&redirect_uri=https://www.baidu.com
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIwebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //开始加载 提示用户正在加载  显示转 正在加载
    [MBProgressHUD showMessage:@"正在加载"];
}
//加载完请求
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //隐藏加载
    [MBProgressHUD hideHUD];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [MBProgressHUD hideHUD];
}
//问你在请求前是否可以加载
//当webView需要加载一个请求的时候 就会调用这个方法 询问一下是否可以请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //达到请求的字符串
    NSString *strUrl = request.URL.absoluteString;
    //判断字符串中是否有code
    NSRange rang = [strUrl rangeOfString:@"code="];
    if (rang.length) {
        NSLog(@"rangel = %ld", rang.length);
        NSString *code = [strUrl substringFromIndex:rang.location + rang.length];
//        code  = 28b6519ff6e2118aeb3b410601e9b657
//        NSLog(@"code  = %@", code);
        [self accessTokenFromCode:code];
        return NO;
    }
  
    return YES;
}

#define WBBaseUrl

-(void)accessTokenFromCode:(NSString *)code{
    //创建一个请求管理器
    [WBAccountTool accessFromCode:code success:^{
        //登入完后  显示新特性还是abbar 判断
        [WBRootView  setRootViewCnotroller:WBKeyWindow];
    } failure:^{
        
    }];
   }
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *){
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
