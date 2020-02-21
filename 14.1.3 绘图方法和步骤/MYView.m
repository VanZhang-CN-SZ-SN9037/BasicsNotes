//
//  MYView.m
//  14.1.3 绘图方法和步骤
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYView.h"

@implementation MYView

- (void)drawRect:(CGRect)rect {
    //1、获取绘图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2、设置绘图路径
    //2.1 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.2 创建起始点
    CGPoint startPoint = CGPointMake(5, 5);
    CGPoint secondPoint = CGPointMake(50, 95);
    CGPoint thirdPoint = CGPointMake(95, 5);
    //2.3 画线
    [path moveToPoint:startPoint];
    [path addLineToPoint:secondPoint];
    [path addLineToPoint:thirdPoint];
    [path closePath];
    //2.4 设置线的属性
    [[UIColor redColor] setStroke];
    //2.5 设置填充颜色
    [[UIColor yellowColor] setFill];
    [path fill];
    
    //3、设置边线的宽度
    CGContextSetLineWidth(context, 3.0);
    
    //4、添加路径到上下文
    CGContextAddPath(context, path.CGPath);
    
    //5、渲染上下文
    CGContextStrokePath(context);
    
}

@end
