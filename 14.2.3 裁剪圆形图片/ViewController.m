//
//  ViewController.m
//  14.2.3 裁剪圆形图片
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clipImageView;

@end

@implementation ViewController

-(UIImage *) clipImage:(UIImage *) image {
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //获取路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //裁剪圆形
    [path addClip];
    //把图片塞进上下文中
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //保存新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"99ios"];
    image = [self clipImage:image];
    self.clipImageView.image = image;
    
    //其他简便方法
    //    self.clipImageView.image = [UIImage imageNamed:@"99ios"];
    //    self.clipImageView.layer.cornerRadius = 10;
    //    self.clipImageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
