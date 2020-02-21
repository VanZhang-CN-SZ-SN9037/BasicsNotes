//
//  ViewController.m
//  10.1.3 网页浏览控制
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
 
#import <WebKit/WebKit.h>
@interface ViewController ()
@property (nonatomic,strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-200)];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.99ios.com"]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}
- (IBAction)goBack:(id)sender {
    [self.webView goBack];
}

- (IBAction)goForward:(id)sender {
    [self.webView goForward];
}
- (IBAction)reload:(id)sender {
    [self.webView reload];
}


@end
