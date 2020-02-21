//
//  UIImage+MYImage.h
//  14.2.2 添加水印
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MYImage)
/*添加水印方法*/
+(UIImage *) image:(UIImage *) image addWatermarkWithString:(NSString *) string;
@end
