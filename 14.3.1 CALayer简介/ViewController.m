//
//  ViewController.m
//  14.3.1 CALayer简介
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(140, 100, 100, 100);
    subLayer.backgroundColor = [UIColor yellowColor].CGColor;
    subLayer.borderColor = [UIColor redColor].CGColor;
    subLayer.borderWidth = 4.0;
    subLayer.cornerRadius = 2.0;
    
    [self.view.layer addSublayer:subLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
