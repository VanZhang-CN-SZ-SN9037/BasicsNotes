//
//  ViewController.m
//  7.7.4 UITextField的代理方法实例之字数限制
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(range.location - range.length >= 3) {
        NSLog(@"字数超出限制，无法继续输入！");
        NSLog(@"%@",string);
        return NO;
    }else {
        NSLog(@"字数未超出限制，可以继续输入！");
        return YES;
    }
}


@end
