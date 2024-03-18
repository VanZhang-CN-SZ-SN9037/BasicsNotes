//
//  MYModel.m
//  8.2.13
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//


#import "MYModel.h"
#import "NSObject+Extent.h"
@implementation MYModel
+(instancetype)myCellModel {
    MYModel *cellModel = [[MYModel alloc]init];
    cellModel.userName = @"99iOS";
    cellModel.profileImageName = @"99logo";
    cellModel.iconName = @"99logo";
    cellModel.source = @"来自99iOS的iPhone 7";
    //创建随机数，根据不同的内容显示不同高度的cell
    int random = arc4random_uniform(2);
    if (random == 1) {
        cellModel.content = @"苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路苹果iOS开发进阶之路";
    }else{
        cellModel.content = @"苹果iOS开发进阶之路";
    }
    //设置高度
    CGFloat contentLabelHeight = [cellModel.content heightWithText:cellModel.content FontSize:[UIFont systemFontOfSize:17.0] LabelWidth:[UIScreen mainScreen].bounds.size.width];
    //计算出来的高度需要多加一点，否则会显示不全
   cellModel.cellLabelHeight = 82.5 + 10 + contentLabelHeight + 10 + 8;
//    cellModel.cellLabelHeight = 76+contentLabelHeight+15;
    return cellModel;
}
@end
