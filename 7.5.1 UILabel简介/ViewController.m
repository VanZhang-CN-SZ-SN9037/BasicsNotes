//
//  ViewController.m
//  7.5.1 UILabel简介
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
    //创建UILabel对象并设置属性
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 250, 50)];
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor whiteColor];
    label.text = @"www.99ios.com";
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    //添加到控制器View
    [self.view addSubview:label];
}


@end
