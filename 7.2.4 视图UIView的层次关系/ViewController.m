//
//  ViewController.m
//  7.2.4
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)addView:(id)sender {
    UIView *addView = [[UIView alloc] init];
    addView.backgroundColor = [UIColor redColor];
    addView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:addView];
}
- (IBAction)changeLayer:(id)sender {
    //从subviews数组中，取出最后添加的视图
    UIView *lastView = (UIView *)[self.view.subviews lastObject];
    //把子视图移到最后
    [self.view sendSubviewToBack:lastView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
