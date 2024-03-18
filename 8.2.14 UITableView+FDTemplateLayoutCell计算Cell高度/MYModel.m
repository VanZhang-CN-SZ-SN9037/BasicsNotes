//
//  MYModel.m
//  8.2.14
//
//  Created by 李维佳 on 2017/4/1.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYModel.h"

@implementation MYModel
+(instancetype)myCellModel {
    MYModel *cellModel= [[MYModel alloc]init];
    int random = arc4random_uniform(2);
    if (random == 1) {
        cellModel.content = @"使用 UITableView+FDTemplateLayoutCell 无疑是解决单元格高度计算问题的最佳实践之一，既有 iOS8 self-sizing 功能简单的 API，又可以达到 iOS7 流畅的滑动效果，还保持了最低支持 iOS6。";
    }else{
        cellModel.content = @"www.99iOS.com";
    }
    return cellModel;
}
@end
