//
//  main.m
//  15.2单例singleton模式
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MYDog.h"
#import "MYPerson.h"
#import "MYStudent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MYDog *dog1 = [MYDog sharedInstance];
        MYDog *dog2 = [[MYDog alloc] init];
        MYDog *dog3 = [dog1 copy];
        NSLog(@"dog1: %p",dog1);
        NSLog(@"dog2: %p",dog2);
        NSLog(@"dog3: %p",dog3);
        MYPerson *person1 = [[MYPerson alloc] init];
        MYPerson *person2 = [MYPerson sharedInstance];
        MYStudent *student1 = [[MYStudent alloc] init];
        MYStudent *student2 = [MYStudent sharedInstance];
        NSLog(@"person1: %p",person1);
        NSLog(@"person2: %p",person2);
        NSLog(@"student1: %p",student1);
        NSLog(@"student2: %p",student2);
    }
    return 0;
}
