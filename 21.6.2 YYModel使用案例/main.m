//
//  main.m
//  21.6.2 YYModel使用案例
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebSite.h"
#import "YYModel.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //创建原始字典
        NSDictionary *dict = @{
                               @"url":@"www.baidu.com",
                               @"name":@"百度",
                               @"foundedYear":@2016
                               };
        //字典转模型
        WebSite *webSite1 = [WebSite yy_modelWithDictionary:dict];
        NSLog(@"-----字典转模型-----");
        NSLog(@"url:%@, name:%@, foundedYear:%@",webSite1.url,webSite1.name,webSite1.foundedYear);
        //模型转json
        NSDictionary *json = [webSite1 yy_modelToJSONObject];
        NSLog(@"-----模型转json-----");
        NSLog(@"%@",json);
        //json转模型
        WebSite *webSite2 = [WebSite yy_modelWithJSON:json];
        NSLog(@"-----json转模型-----");
        NSLog(@"url:%@, name:%@, foundedYear:%@",webSite2.url,webSite2.name,webSite2.foundedYear);
        
    }
    return 0;
}


