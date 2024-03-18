//
//  ViewController.m
//  7.5.2 常用的UILabel使用场景
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
    UILabel *label =  [[UILabel alloc]initWithFrame:CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width - 40, 30)];
    label.text = @"九九学院 -- www.99ios.com";
    label.backgroundColor = [UIColor lightGrayColor];
    label.textAlignment =  NSTextAlignmentCenter;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:label.text];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0,4)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30] range:NSMakeRange(0, 4)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(12, 5)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:25] range:NSMakeRange(12, 5)];
    label.attributedText = attributedString;
    [self.view addSubview:label];
}


@end
