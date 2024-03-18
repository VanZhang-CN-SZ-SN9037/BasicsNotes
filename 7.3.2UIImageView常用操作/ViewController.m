//
//  ViewController.m
//  7.3.2UIImageView常用操作
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
    //设置圆角
    imageView.layer.cornerRadius = 5;
    imageView.layer.cornerRadius = 100;
    imageView.layer.masksToBounds = YES;
    //设置边框
    imageView.layer.borderWidth = 5;
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [imageView addGestureRecognizer:tap];
    imageView.userInteractionEnabled = YES;
    //添加到控制器view
    [self.view addSubview:imageView];
}


-(void) tapAction {
    NSLog(@"%s",__func__);
}

@end
