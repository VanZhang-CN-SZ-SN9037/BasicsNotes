//
//  ClassB.h
//  6.1.3
//
//  Created by 李维佳 on 2017/3/28.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"
@interface ClassB : NSObject <NSCopying>
@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) ClassA *customClass;
@property (nonatomic, weak) id delegate;
@property (nonatomic,assign) int number;
@end
