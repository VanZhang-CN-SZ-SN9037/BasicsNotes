//
//  Person.m
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "Person.h"

@implementation Person
//实现NSCoding协议中的归档方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.age forKey:@"age"];
}
//实现NSCoding协议中的解档方法
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}

+(instancetype)personWithDict:(NSDictionary *) dict {
    Person *person = [[Person alloc]init];
    person.name = dict[@"name"];
    person.age = dict[@"age"];
    return person;
}
@end
