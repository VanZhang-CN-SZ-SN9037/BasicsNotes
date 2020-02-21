//
//  ViewController.m
//  10.2.2 UITextView的代理方法
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    textView.center =CGPointMake([UIScreen mainScreen].bounds.size.width/2, 200) ;
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.textAlignment = NSTextAlignmentCenter;
    textView.scrollEnabled = YES;
    textView.textColor = [UIColor redColor];
    textView.keyboardType = UIKeyboardTypeNamePhonePad;
    textView.returnKeyType = UIReturnKeyDone;
    textView.text = @"99iOS--苹果iOS开发进阶之路";
    textView.font = [UIFont systemFontOfSize:20.0];
    textView.contentInset = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    
    textView.delegate = self;
    
    self.textView = textView;
    [self.view addSubview:textView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textView resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"%s",__func__);
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"%s",__func__);
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"%s",__func__);
}



@end
