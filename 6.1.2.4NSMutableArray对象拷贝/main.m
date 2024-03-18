//
//  main.m
//  6.1.2.4NSMutableArray对象拷贝
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"NSMutableArray对象复制");
        NSMutableString *string = [NSMutableString stringWithFormat:@"九九学院"];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:string, nil];
        NSMutableArray *array1 = [array copy];
        NSMutableArray *array2 = [array mutableCopy];
        NSLog(@"对象类型：%@",[NSMutableArray class]);
        NSLog(@"原对象指向的存储地址：%p",array);
        NSLog(@"使用copy方法得到的对象指向的存储地址：%p",array1);
        NSLog(@"使用mutableCopy方法得到的对象指向的存储地址：%p",array2);
        NSLog(@"结论：NSMutableArray类不论使用copy还是mutableCopy都为深复制。");
        NSLog(@"-------------------------------------------------------");
        NSLog(@"原容器内的对象指向的存储地址：%p",array[0]);
        NSLog(@"使用copy方法得到的容器内的对象指向的存储地址：%p",array1[0]);
        NSLog(@"使用mutableCopy方法得到的容器内的对象指向的存储地址：%p",array2[0]);
        NSLog(@"结论：NSMutableArray类不论使用copy还是mutableCopy，容器内的对象都是浅复制。");
    }
    return 0;
}
