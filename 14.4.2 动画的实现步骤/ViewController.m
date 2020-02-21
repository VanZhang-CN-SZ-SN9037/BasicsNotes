//
//  ViewController.m
//  14.4.2 动画的实现步骤
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
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //初始化CALayer对象，并添加到控制器view的layer上
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(140, 100, 100, 100);
    subLayer.backgroundColor = [UIColor yellowColor].CGColor;
    subLayer.borderColor = [UIColor redColor].CGColor;
    subLayer.borderWidth = 4.0;
    subLayer.cornerRadius = 2.0;
    [self.view.layer addSublayer:subLayer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //1-实例化CABasicAnimation对象
        CABasicAnimation *animation = [CABasicAnimation animation];
        //2-设置动画属性
        animation.keyPath = @"position";
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(290, 150)];
        animation.duration = 2.0;
        //3-添加动画对象到一个CALayer类的对象上，播放动画
        [subLayer addAnimation:animation forKey:nil];
    });
}



@end
