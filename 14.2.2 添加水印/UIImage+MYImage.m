//
//  UIImage+MYImage.m
//  14.2.2 添加水印
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "UIImage+MYImage.h"

@implementation UIImage (MYImage)

+ (UIImage *)image:(UIImage*)image addWatermarkWithString:(NSString *)string{
    //开启上下文，注意：生成的图文上下文的size
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //添加图片到上下文
    [image drawAtPoint:CGPointMake(0, 20)];
    //添加文字到上下文
    NSDictionary *dict = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:40.0],
                           NSForegroundColorAttributeName:[UIColor blackColor]
                           };
    [string drawAtPoint:CGPointMake(0, 20)
         withAttributes:dict];
    //生成新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文，节省内存
    UIGraphicsEndImageContext();
    return newImage;
}

@end
