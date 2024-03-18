//
//  main.m
//  6.3.3 条件编译03
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#ifndef


int main(int argc, const char * argv[]) {
    @autoreleasepool {
#ifndef NOTRUN
        NSLog(@"宏NOTRUN没有被定义");
#endif
    }
    return 0;
}
