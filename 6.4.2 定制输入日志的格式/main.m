//
//  main.m
//  6.4.2 定制输入日志的格式
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.name = @"jack";
        p.sex = @"man";
        p.age = 18;
        //打印对象信息
        NSLog(@"%@", p);
        NSLog(@"%@", [p class]);
    }
    return 0;
}
