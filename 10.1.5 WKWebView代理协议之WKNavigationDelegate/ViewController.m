//
//  ViewController.m
//  10.1.5 WKWebView代理协议之WKNavigationDelegate
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import <WebKit/WebKit.h>
@interface ViewController ()<WKNavigationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化WKWebView对象
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    //创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.99ios.com"]];
    //加载网页
    [webView loadRequest:request];
    //设置代理
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s",__func__);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s",__func__);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s",__func__);
}

@end
