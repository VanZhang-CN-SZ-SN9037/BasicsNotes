//
//  ViewController.m
//  8.4.6 长按手势UILongPressGestureRecognizer
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
    //创建UIView对象
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 150, 150)];
    imageView.image = [UIImage imageNamed:@"99logo"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    //长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [imageView addGestureRecognizer:longPressGesture];
}

- (void) longPress: (UILongPressGestureRecognizer *) gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按开始");
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        NSLog(@"长按结束");
    }
    else {
        NSLog(@"长按中");
    }
}


@end
