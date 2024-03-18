//
//  main.m
//  6.2 内存管理
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj1 = [[NSObject alloc] init];
        NSLog(@"obj1 当前引用计数：%lu",(unsigned long)[obj1 retainCount]);
        NSObject *obj2 = [obj1 retain];
        NSLog(@"obj1 当前引用计数：%lu",(unsigned long)[obj1 retainCount]);
        [obj2 release];
        NSLog(@"obj1 当前引用计数：%lu",(unsigned long)[obj1 retainCount]);
        [obj1 release];
    }
    return 0;
}
