//
//  ViewController.m
//  14.4.7 CAAnimationGroup动画组
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *myLayer;
@end

@implementation ViewController

-(CALayer *)myLayer{
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
    //1.1 实例化CABasicAnimation对象
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    //1.2 设置动画属性
    animation1.keyPath = @"transform.translation.x";
    animation1.toValue = @100;
    //2.1 实例化CABasicAnimation对象
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    //2.2 设置动画属性
    animation2.keyPath = @"opacity";
    animation2.fromValue = @1.0;
    animation2.toValue = @0.1;
    //3.1 实例化CAAnimationGroup对象
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    //3.2 设置动画组属性
    animationGroup.animations = @[animation1,animation2];
    animationGroup.duration = 2.0;
    //4. 添加动画组对象到一个CALayer类的对象上，播放动画
    [self.myLayer addAnimation:animationGroup forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
