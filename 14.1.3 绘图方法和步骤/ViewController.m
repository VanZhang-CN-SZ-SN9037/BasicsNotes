//
//  ViewController.m
//  14.1.3 绘图方法和步骤
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import "MYView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MYView *myView = [[MYView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:myView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
