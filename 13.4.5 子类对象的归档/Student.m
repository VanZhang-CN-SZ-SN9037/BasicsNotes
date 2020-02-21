//
//  Student.m
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)encodeWithCoder:(NSCoder *)aCoder{
    //调用父类的方法
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.score forKey:@"score"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    //调用父类的方法
    self = [super initWithCoder:coder];
    if (self) {
        self.score = [coder decodeObjectForKey:@"score"];
    }
    return self;
}
@end
