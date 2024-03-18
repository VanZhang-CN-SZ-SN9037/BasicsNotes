//
//  NSObject+Extent.m
//  8.2.13
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//


#import "NSObject+Extent.h"

@implementation NSObject (Extent)
- (CGFloat) heightWithText:(NSString *) text FontSize:(UIFont *) font LabelWidth:(CGFloat) width{
    NSDictionary * attributes = @{NSFontAttributeName : font};
    CGSize contentSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                         attributes:attributes
                                            context:nil].size;
    return contentSize.height   ;
}
@end
