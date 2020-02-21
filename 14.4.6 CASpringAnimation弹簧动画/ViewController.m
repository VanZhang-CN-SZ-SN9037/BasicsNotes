//
//  ViewController.m
//  14.4.6 CASpringAnimation弹簧动画
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *myLayer;
@end

@implementation ViewController

- (CALayer *)myLayer{
    if (_myLayer == nil) {
        _myLayer = [CALayer layer];
        _myLayer.frame = CGRectMake(140, 100, 100, 100);
        _myLayer.backgroundColor = [UIColor yellowColor].CGColor;
        _myLayer.borderColor = [UIColor redColor].CGColor;
        _myLayer.borderWidth = 4.0;
        _myLayer.cornerRadius = 2.0;
    }
    return _myLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer addSublayer:self.myLayer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1. 实例化CASpringAnimation对象
    CASpringAnimation *animation = [CASpringAnimation animation];
    //2. 设置动画属性
    animation.keyPath = @"transform.translation.y";
    animation.fromValue = @0;
    animation.toValue = @200;
    animation.mass = 100;
    animation.stiffness = 100;
    animation.damping = 10;
    animation.duration = 2.0;
    //3. 添加动画对象到一个CALayer类的对象上，播放动画
    [self.myLayer addAnimation:animation forKey:nil];
}
@end
