//
//  ViewController.m
//  7.2.9 使用代码创建自定义UIView
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "MYView.h"
@interface ViewController ()
@property(nonatomic,strong)MYView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView = [[MYView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    [self.view addSubview:self.myView];
}


@end
