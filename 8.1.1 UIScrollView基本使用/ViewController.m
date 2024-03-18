//
//  ViewController.m
//  8.1.1 UIScrollView基本使用
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    //创建一个与屏幕等宽等高的滚动视图
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //设置滚动区域的大小
    myScrollView.contentSize = imageView.bounds.size;
    //设置滚动视图的其他属性
    myScrollView.backgroundColor = [UIColor redColor];
    myScrollView.contentOffset = CGPointMake(0, 0);
    myScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //添加子视图
    [myScrollView addSubview:imageView];
    [self.view addSubview:myScrollView];
}


@end
