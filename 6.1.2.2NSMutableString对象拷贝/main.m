//
//  main.m
//  6.1.2.2NSMutableString对象拷贝
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"NSMutableString对象复制");
        NSMutableString *string = [NSMutableString stringWithFormat:@"九九学院"];
        NSMutableString *string1 = [string copy];
        NSMutableString *string2 = [string mutableCopy];
        NSLog(@"对象类型：%@",[NSMutableString class]);
        NSLog(@"原对象指向的存储地址：%p",string);
        NSLog(@"使用copy方法得到的对象指向的存储地址：%p",string1);
        NSLog(@"使用mutableCopy方法得到的对象指向的存储地址：%p",string2);
        NSLog(@"结论：NSMutableString类使用copy为深复制, 使用mutableCopy为深复制");
    }
    return 0;
}
