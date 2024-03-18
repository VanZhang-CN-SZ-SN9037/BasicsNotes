//
//  main.m
//  6.3.3 条件编译02
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#ifdef

#define RUN
int main(int argc, const char * argv[]) {
    @autoreleasepool {
#ifdef RUN
        NSLog(@"宏RUN被定义了");
#endif
    }
    return 0;
}
