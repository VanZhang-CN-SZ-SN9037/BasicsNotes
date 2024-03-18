//
//  ClassB.m
//  6.1.3
//
//  Created by 李维佳 on 2017/3/28.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB
//-(id)copyWithZone:(NSZone *)zone{
//    return self;
//}

-(id)copyWithZone:(NSZone *)zone{
    ClassB *copyObject = [[[self class] allocWithZone:zone] init];
    copyObject.name = [self.name mutableCopy];
    copyObject.customClass = self.customClass;
    copyObject.delegate = self.delegate;
    copyObject.number = self.number;
    return copyObject;
}
@end
