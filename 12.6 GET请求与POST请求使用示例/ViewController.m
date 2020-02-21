//
//  ViewController.h
//  12.6 GET请求与POST请求使用示例
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//


#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"836d1b30b88ba5d8e73430143e2392c5", @"key",nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://v.juhe.cn/weixin/query" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        // 通过uploadProgress可以获取数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //获取所需数据
        NSDictionary *dict = [responseObject objectForKey:@"result"];
        NSArray *arr = dict[@"list"];
        NSDictionary *dic = arr[2];
        NSLog(@"%@",dic[@"title"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
