//
//  ViewController.m
//  14.4.8 CATransition转场动画
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,strong) UIImageView *transitionView;
@end

@implementation ViewController

-(UIImageView *)transitionView{
    if (_transitionView == nil) {
        _transitionView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 100, 100, 100)];
        _transitionView.image = [UIImage imageNamed:@"99logo"];
    }
    return _transitionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.transitionView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //切换图片显示
    self.transitionView.image = [UIImage imageNamed:@"football"];
    //创建一个CATransition动画对象
    CATransition *animation = [CATransition animation];
    animation.type = @"fade";
    animation.duration = 2.0;
    //添加CATransition对象到transitionView的layer上
    [self.transitionView.layer addAnimation:animation forKey:nil];
}


@end
