//
//  MyModel.h
//  8.2.12
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MYModel : NSObject
@property (nonatomic,copy) NSString *profileImageName;//头像
@property (nonatomic,copy) NSString *userName;//发送用户
@property (nonatomic,copy) NSString *source;//设备来源
@property (nonatomic,copy) NSString *content;//内容
@property (nonatomic,copy) NSString *iconName;//小图标
@property (nonatomic,assign) CGFloat cellLabelHeight;
+(instancetype)myCellModel;
@end
