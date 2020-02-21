//
//  ViewController.m
//  17.6.1 拨打电话功能
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import<WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//方法一
- (IBAction)callUp:(id)sender {
    NSString * phoneNum = [NSString stringWithFormat:@"tel://%@", self.textField.text];
    NSURL *url = [NSURL URLWithString:phoneNum];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url options:@{} completionHandler:nil];
    }
}

//方法二
- (IBAction)callUpUseWKWebView:(id)sender {
    NSString *phoneNum = [NSString stringWithFormat:@"telprompt://%@", self.textField.text];
    WKWebView *webView = [[WKWebView alloc] init];
    webView.navigationDelegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:phoneNum]]];
    [self.view addSubview:webView];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *url = navigationAction.request.URL;
    UIApplication *app = [UIApplication sharedApplication];
    if ([url.absoluteString hasPrefix:@"tel"]) {
        if ([app canOpenURL:url]) {
            [app openURL:url options:@{} completionHandler:nil];
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

//方法三
- (IBAction)callUpUseUIWebView:(id)sender {
    NSString *phoneNum = [NSString stringWithFormat:@"tel://%@",self.textField.text];
    UIWebView *webView = [[UIWebView alloc]init];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:phoneNum]]];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
