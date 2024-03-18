//
//  main.m
//  6.5.2 结构的嵌套
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //普通初始化方法
        CGPoint point = {0,0};
        CGSize size = {100,100};
        CGRect frame = {point, size};
        //快速初始化
        CGPoint point1 = CGPointMake(0, 0);
        CGSize size1 = CGSizeMake(100, 100);
        CGRect frame1 = {point1, size1};
        //快速初始化
        CGRect frame2 = CGRectMake(0, 0, 100, 100);
        //修改
        frame.size.width = 200;
        frame1.size.width = 200;
        NSLog(@"frame.size.width：%f",frame.size.width);
        NSLog(@"frame1.size.width：%f",frame1.size.width);
        NSLog(@"frame2.size.width：%f",frame2.size.width);
    }
    return 0;
}
