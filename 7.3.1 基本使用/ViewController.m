//
//  ViewController.m
//  7.3.1 基本使用
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
    //初始化UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 50, 200, 200)];
    imageView.image = [UIImage imageNamed:@"99logo"];
    //添加到控制器view
    [self.view addSubview:imageView];
}


@end
