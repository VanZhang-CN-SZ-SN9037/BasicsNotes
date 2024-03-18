//
//  ViewController.m
//  7.7.1 UITextField的基本属性
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个UITextField对象，并对样式和属性进行设置
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"欢迎访问99iOS";;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearsOnBeginEditing = YES;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType =UIReturnKeyDone;
    textField.clearsOnInsertion = YES;
    [self.view addSubview:textField];
}


@end
