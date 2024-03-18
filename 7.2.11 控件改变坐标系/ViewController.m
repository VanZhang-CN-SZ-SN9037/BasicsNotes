//
//  ViewController.m
//  7.2.11
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *grayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"图片在父视图坐标系的坐标:x:%f, y:%f",self.imageView.frame.origin.x,self.imageView.frame.origin.y);
    CGRect newFrame = [self.grayView convertRect:self.imageView.frame toView:self.view];
    NSLog(@"图片在控制器View坐标系的坐标:x:%f, y:%f",newFrame.origin.x,newFrame.origin.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
