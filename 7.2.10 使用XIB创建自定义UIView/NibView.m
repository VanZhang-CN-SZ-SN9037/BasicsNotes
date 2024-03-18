//
//  NibView.m
//  7.2.10
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "NibView.h"

@implementation NibView

+(NibView *)initFromNib{
    NSLog(@"%s",__func__);
    return [[[NSBundle mainBundle] loadNibNamed:@"NibView" owner:self options:nil] lastObject];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    NSLog(@"%s",__func__);
    self = [super initWithCoder:coder];
    if (self) {
        //这里可以添加一些视图的定制代码
    }
    return self;
}

//用于定制View的样式，使用Xib建议在awakeFromNib中设置视图属性
-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",__func__);
    self.alpha = 0.5;
}

@end
