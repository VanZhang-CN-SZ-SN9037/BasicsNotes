//
//  MYPerson.m
//  15.2 单例singleton模式
//
//  Created by 李维佳 on 2017/4/7.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYPerson.h"

@implementation MYPerson

static id _instance;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

@end
