//
//  ViewController.m
//  7.7.3 UITextField的代理方法实例之键盘回收
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField *textField;
@end

@implementation ViewController
-(UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.placeholder = @"欢迎访问99iOS";;
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.delegate = self;
    }
    return _textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加textField对象到控制器view
    [self.view addSubview:self.textField];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
}
@end
