//
//  main.m
//  6.3.1 宏定义
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define STRING(n) #n
#define CONNECT(a, b, c) (a##b##c)
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%s", STRING(www.99ios.com));
        NSLog(@"%f", CONNECT(13.6, 2, 3));
    }
    return 0;
}
