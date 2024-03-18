//
//  main.m
//  6.1.2.1NSString对象拷贝
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"NSString对象复制");
        NSString *string = @"九九学院";
        NSString *string1 = [string copy];
        NSString *string2 = [string mutableCopy];
        NSLog(@"对象类型：%@",[NSString class]);
        NSLog(@"原对象指向的存储地址：%p",string);
        NSLog(@"使用copy方法得到的对象指向的存储地址：%p",string1);
        NSLog(@"使用mutableCopy方法得到的对象指向的存储地址：%p",string2);
        NSLog(@"结论：NSString类使用copy为浅复制（指针复制）, 使用mutableCopy为深复制");
    }
    return 0;
}
