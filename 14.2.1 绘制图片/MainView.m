//
//  MainView.m
//  14.2.1 绘制图片
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MainView.h"

@implementation MainView

-(void)drawRect:(CGRect)rect{
    UIImage *image1 = [UIImage imageNamed:@"logo"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"99ios" ofType:@"png"];
    UIImage *image2 = [UIImage imageWithContentsOfFile:path];
    
//    //先绘制image1
//    [image1 drawInRect:CGRectMake(0, 150, 100, 100)];
//    //再绘制image2
//    [image2 drawAtPoint:CGPointZero];
    
    //先绘制image2
    [image2 drawAtPoint:CGPointZero];
    //再绘制image1
    [image1 drawInRect:CGRectMake(0, 150, 100, 100)];
}

@end
