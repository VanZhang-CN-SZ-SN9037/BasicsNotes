//
//  ViewController.m
//  10.1.2 WKWebView的基本使用—加载网页
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import<WebKit/WebKit.h>

@interface ViewController ()

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
    [self.view addSubview:webView];
}


@end
