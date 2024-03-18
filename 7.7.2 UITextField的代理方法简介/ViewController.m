//
//  ViewController.m
//  7.7.2 UITextField的代理方法简介
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"欢迎访问99iOS";;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    [self.view addSubview:textField];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField;{
    NSLog(@"%s",__func__);
    NSLog(@"开始输入内容！");
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
    NSLog(@"%s",__func__);
    NSLog(@"输入结束！");
}

@end
