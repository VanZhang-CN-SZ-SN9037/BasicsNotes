//
//  main.m
//  6.1.3 自定义对象复制
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassA *classA = [[ClassA alloc] init];
        ClassB *myClass1 = [[ClassB alloc] init];
        myClass1.name = @"ABC";
        myClass1.customClass = classA;
        myClass1.delegate = classA;
        myClass1.number = 100;
        ClassB *myClass2 = [myClass1 copy];
        NSLog(@"对象类: 【%@】 原对象内存地址： 【%p】, 拷贝对象内存地址: 【%p】",[ClassB class], myClass1, myClass2 );
        NSLog(@"【原对象】：copy属性-【%p】, strong属性-【%p】,weak属性-【%p】, assign属性-【%d】", myClass1.name, myClass1.customClass, myClass1.delegate, myClass1.number);
        NSLog(@"【拷贝对象】：copy属性-【%p】, strong属性-【%p】,weak属性-【%p】, assign属性-【%d】", myClass2.name, myClass2.customClass, myClass2.delegate, myClass2.number);
    }
    return 0;
}
