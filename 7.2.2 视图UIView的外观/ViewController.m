//
//  ViewController.m
//  7.2.2 视图UIView的外观
//
//  Created by VanZhang on 2020/2/24.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加yellowView到控制器视图self.view
    UIView *yellowView = [[UIView alloc] init];
    yellowView.frame = CGRectMake(100, 100, 200, 200);
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    NSLog(@"yellowView.frame:%@",NSStringFromCGRect(yellowView.frame));
    NSLog(@"yellowView.bounds:%@",NSStringFromCGRect(yellowView.bounds));
    NSLog(@"yellowView.center:%@",NSStringFromCGPoint(yellowView.center));
    
    //添加redView到控制器视图self.view
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(0, 0, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    NSLog(@"redView.frame:%@",NSStringFromCGRect(redView.frame));
    NSLog(@"redView.bounds:%@",NSStringFromCGRect(redView.bounds));
    NSLog(@"redView.center:%@",NSStringFromCGPoint(redView.center));
    
    //添加blueView到yellowView
    UIView *blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(0, 0, 100, 100);
    blueView.backgroundColor = [UIColor blueColor];
    [yellowView addSubview:blueView];
    NSLog(@"blueView.frame:%@",NSStringFromCGRect(blueView.frame));
    NSLog(@"blueView.bounds:%@",NSStringFromCGRect(blueView.bounds));
    NSLog(@"blueView.center:%@",NSStringFromCGPoint(blueView.center));
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}


@end
