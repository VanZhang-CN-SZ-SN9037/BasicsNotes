//
//  ViewController.m
//  11.2.5 延迟执行操作
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //延迟2秒执行printLog
    [self performSelector:@selector(printLog) withObject:nil afterDelay:2.0];
}
-(void) printLog{
    NSLog(@"延迟2.0秒后打印出来的日志！");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
