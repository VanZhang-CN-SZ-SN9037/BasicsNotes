//
//  main.m
//  6.1.1 深复制与浅复制
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ClassA.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *string = [[NSMutableString alloc] initWithFormat:@"www.99ios.com"];
        ClassA *classA = [[ClassA alloc] init];
        classA.name = string;
        [string appendString:@"+"];
        NSLog(@"原字符串值 : %@ ， 内存地址: %p", string ,string);
        NSLog(@"拷贝字符串值 : %@ ，内存地址: %p", classA.name ,classA.name);
    }
    return 0;
}
