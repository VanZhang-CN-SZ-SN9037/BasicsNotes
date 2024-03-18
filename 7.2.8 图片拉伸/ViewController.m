//
//  ViewController.m
//  7.2.8 图片拉伸
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"bottleButtonDarkHighlight"];
    [image resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)];//上下左右各保留15PX的内容
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(30, 100, 250, 150);
    [self.view addSubview:imageView];
}


@end
