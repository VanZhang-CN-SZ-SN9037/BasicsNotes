//
//  MyModel.m
//  8.2.12
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYModel.h"
//#import "NSObject+Extent.h"
@implementation MYModel
+(instancetype)myCellModel {
    MYModel *cellModel = [[MYModel alloc]init];
    cellModel.userName = @"99iOS";
    cellModel.profileImageName = @"99logo";
    cellModel.iconName = @"99logo";
    cellModel.source = @"来自99的iPhone 7 Plus";
    int arcNumber = arc4random_uniform(2);
    if (arcNumber == 1) {
        cellModel.content = @"对于需要动态调整高度的控件，在使用自动布局设置约束时，一定不要设置其绝对高度，其高度要根据控件与周边其他控件的位置约束来决定。如下图所示";
    }else {
        cellModel.content = @"苹果iOS开发进阶之路";
    }
    return cellModel;
}
@end
