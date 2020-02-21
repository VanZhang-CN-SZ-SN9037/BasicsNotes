//
//  ViewController.m
//  14.2.2 添加水印
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+MYImage.h"
@interface ViewController ()

@end

@implementation ViewController
 

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"99logo"];
    NSString *string = @"九九学院";
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    //添加水印
    imageView.image = [UIImage image:image addWatermarkWithString:string];
    //添加到主视图
    [self.view addSubview:imageView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
