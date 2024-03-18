//
//  ViewController.m
//  8.4.3 捏合与旋转手势UIPinchGestureRecognizer
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 150, 150)];
    imageView.image = [UIImage imageNamed:@"99logo"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    //捏合手势
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    //添加到imageView
    [imageView addGestureRecognizer:pinchGesture];
    
    //旋转手势
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [imageView addGestureRecognizer:rotationGesture];
}

- (void) pinch:(UIPinchGestureRecognizer *) gesture {
    NSLog(@"%s, 缩放比例: %f",__func__,gesture.scale);
    CGFloat scale = gesture.scale;
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, scale, scale);
    //一定要把scale的值重置为1，否则会影响缩放效果，即缩放比例会在上一次基础上进行缩小/放大
    gesture.scale = 1;
}

-(void) rotation:(UIRotationGestureRecognizer *) gesture {
    NSLog(@"%s, rotation:%f, velocity:%f",__func__,gesture.rotation,gesture.velocity);
    CGFloat rotation = gesture.rotation;
    gesture.view.transform = CGAffineTransformRotate(gesture.view.transform, rotation);
    //一定要把rotation的值重置为0，否则会影响旋转效果
    gesture.rotation = 0;
}

@end
