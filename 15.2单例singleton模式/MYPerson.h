//
//  MYPerson.h
//  15.2 单例singleton模式
//
//  Created by 李维佳 on 2017/4/7.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYPerson : NSObject
/**
 *  获取单例类
 *
 *  @return 单例类对象
 */
+(instancetype) sharedInstance;

@end
