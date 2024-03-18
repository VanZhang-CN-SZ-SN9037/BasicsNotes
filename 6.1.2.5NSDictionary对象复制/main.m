//
//  main.m
//  6.1.2.5NSDictionary对象复制
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"NSDictionary对象复制");
        NSString *webSite = @"www.99ios.com";
        
        NSDictionary *dict = @{
                               @"webSite":webSite
                               };
        NSDictionary *dict1 = [dict copy];
        NSDictionary *dict2 = [dict mutableCopy];
        NSLog(@"对象类型：%@",[NSDictionary class]);
        NSLog(@"原对象指向的存储地址：%p",dict);
        NSLog(@"使用copy方法得到的对象指向的存储地址：%p",dict1);
        NSLog(@"使用mutableCopy方法得到的对象指向的存储地址：%p",dict2);
        NSLog(@"结论：NSDictionary类使用copy为浅复制, 使用mutableCopy为深复制。");
        NSLog(@"-------------------------------------------------------");
        NSLog(@"原容器内的对象指向的存储地址：%p",dict[@"webSite"]);
        NSLog(@"使用copy方法得到的容器内的对象指向的存储地址：%p",dict1[@"webSite"]);
        NSLog(@"使用mutableCopy方法得到的容器内的对象指向的存储地址：%p",dict2[@"webSite"]);
        NSLog(@"结论：NSDictionary类不论使用copy还是mutableCopy，容器内的对象都是浅复制。");
    }
    return 0;
}
