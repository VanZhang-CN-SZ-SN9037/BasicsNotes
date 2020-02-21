//
//  ViewController.m
//  10.2.1 UITextView的基本使用
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    [self.view addSubview:textView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
