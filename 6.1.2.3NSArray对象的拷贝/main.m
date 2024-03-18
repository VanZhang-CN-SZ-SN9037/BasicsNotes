//
//  main.m
//  6.1.2.3NSArray对象的拷贝
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"NSArray对象复制");
        NSString *string = @"九九学院";
        NSArray *array = [NSArray arrayWithObjects:string, nil];
        NSArray *array1 = [array copy];
        NSArray *array2 = [array mutableCopy];
        NSLog(@"对象类型：%@",[NSArray class]);
        NSLog(@"原对象指向的存储地址：%p",array);
        NSLog(@"使用copy方法得到的对象指向的存储地址：%p",array1);
        NSLog(@"使用mutableCopy方法得到的对象指向的存储地址：%p",array2);
        NSLog(@"结论：NSArray类使用copy为浅复制, 使用mutableCopy为深复制。");
        NSLog(@"-------------------------------------------------------");
        NSLog(@"原容器内的对象指向的存储地址：%p",array[0]);
        NSLog(@"使用copy方法得到的容器内的对象指向的存储地址：%p",array1[0]);
        NSLog(@"使用mutableCopy方法得到的容器内的对象指向的存储地址：%p",array2[0]);
        NSLog(@"结论：NSArray类不论使用copy还是mutableCopy，容器内的对象都是浅复制。");
    }
    return 0;
}
