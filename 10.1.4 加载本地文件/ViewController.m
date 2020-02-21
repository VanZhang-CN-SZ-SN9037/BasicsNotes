//
//  ViewController.m
//  10.1.4 加载本地文件
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建webview
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width)];
    // 2.创建url  这里的userName替换成电脑用户名
    NSURL *url = [NSURL fileURLWithPath:@"/Users/userName/Desktop/99logo.png"];
    // 3.加载文件
    [webView loadFileURL:url allowingReadAccessToURL:url];
    // 4.将webView添加到界面
    [self.view addSubview:webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
