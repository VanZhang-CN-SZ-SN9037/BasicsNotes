//
//  Person.m
//  13.2.4 操作实例
//
//  Created by 李维佳 on 2017/4/4.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "Person.h"

@implementation Person
+(instancetype) personWithDict:(NSDictionary *)dict{
    Person *person = [[Person alloc] init];
    person.name = dict[@"name"];
    person.age = dict[@"age"];
    return person;
}

@end
