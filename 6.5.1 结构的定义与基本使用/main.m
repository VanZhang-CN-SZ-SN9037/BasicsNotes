//
//  main.m
//  6.5.1 结构的定义与基本使用
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //定义名为Date的结构体
        struct Date {
            int day;
            int month;
            int year;
        };
        //声明一个名为today的结构体变量，类型为date，此时会分配内存空间，用来存储日月年
        struct Date today;
        //初始化--点语法
        today.day = 2;
        today.month = 9;
        today.year = 2016;
        //初始化--直接赋值
        struct Date tomorrow = {3,9,2016};
        //访问
        NSLog(@"今天是:%d年%d月%d日",today.year,today.month,today.day);
        NSLog(@"明天是:%d年%d月%d日",tomorrow.year,tomorrow.month,tomorrow.day);
    }
    return 0;
}
