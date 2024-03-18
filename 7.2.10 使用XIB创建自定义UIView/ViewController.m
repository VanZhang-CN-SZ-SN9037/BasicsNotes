//
//  ViewController.m
//  7.2.10 使用XIB创建自定义UIView
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import "NibView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NibView *nibView = [NibView initFromNib];
    [self.view addSubview:nibView];
}



@end
