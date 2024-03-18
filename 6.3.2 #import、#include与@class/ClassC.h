//
//  ClassC.h
//  6.3.2
//
//  Created by 李维佳 on 2017/3/29.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
@class ClassA;
@interface ClassC : NSObject
@property (nonatomic,strong) ClassA *classA;
@property (nonatomic,strong) ClassB *classB;
@end
