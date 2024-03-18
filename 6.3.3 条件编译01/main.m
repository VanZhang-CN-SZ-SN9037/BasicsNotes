//
//  main.m
//  6.3.3 条件编译01
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//#if  #elif  #else

#define IOS10 1
#define IOS9 0

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // #if 和 #endif 配对出现，#endif 用于终止 #if 预处理指令
#if IOS10
        NSLog(@"这是一个运行iOS10的设备！");
#elif IOS9
        NSLog(@"这是一个运行iOS9的设备！");
#else
        NSLog(@"这个设备既不运行iOS10，也不运行iOS9！");
#endif
    }
    return 0;
}
