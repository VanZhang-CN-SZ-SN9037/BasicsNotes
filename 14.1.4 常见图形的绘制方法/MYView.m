//
//  MYView.m
//  14.1.4 常见图形的绘制方法
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYView.h"
@implementation MYView

- (void)drawRect:(CGRect)rect {
//    [self drawLine];
//    [self drawOval];
    [self drawRect];
}
//绘制直线
- (void)drawLine {
    //获取上下文/环境
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画笔宽度
    CGContextSetLineWidth(context, 3.0);
    //设置画笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //绘图
    //创建绘图路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置起始点
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(200, 200)];
    //添加到上下文
    CGContextAddPath(context, path.CGPath);
    //渲染上下文
    CGContextStrokePath(context);
}
//绘制矩形
- (void)drawRect {
    //获取上下文/环境
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画笔宽度
    CGContextSetLineWidth(context, 3.0);
    //设置画笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    //绘图
    //设置矩形的位置和大小
    CGRect myRect = CGRectMake(50, 50, 100, 100);
    //创建绘图路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:myRect];
    //添加到上下文
    CGContextAddPath(context, path.CGPath);
    //渲染上下文
    CGContextStrokePath(context);
}
//绘制圆形/椭圆形
- (void)drawOval {
    //获取上下文/环境
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置画笔宽度
    CGContextSetLineWidth(context, 3.0);
    //设置画笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    //绘图
    //设置矩形的位置和大小
    CGRect myRect = CGRectMake(50, 50, 200, 100);
    //创建绘图路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:myRect];
    //添加到上下文
    CGContextAddPath(context, path.CGPath);
    //渲染上下文
    CGContextStrokePath(context);
}
@end
