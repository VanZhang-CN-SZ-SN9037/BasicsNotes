//
//  NSObject+Extent.h
//  8.2.13
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extent)
- (CGFloat) heightWithText:(NSString *) text FontSize:(UIFont *) font LabelWidth:(CGFloat) width;
@end
