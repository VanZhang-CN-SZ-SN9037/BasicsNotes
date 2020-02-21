//
//  ViewController.h
//  11.2.2 队列与任务组合
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//1.异步任务+并行队列
- (void)viewDidLoad {
    [super viewDidLoad];
    //获取并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建异步任务，并放到并行队列中执行
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task1:%d",i);
        }
        NSLog(@"task1----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task2:%d",i);
        }
        NSLog(@"task2----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            NSLog(@"task3:%d",i);
        }
        NSLog(@"task3----%@",[NSThread currentThread]);
    });
}

//2.异步任务+串行队列
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //创建串行队列
//    dispatch_queue_t queue = dispatch_queue_create("com.99ios", NULL);
//    //创建异步任务
//    dispatch_async(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task1:%d",i);
//        }
//        NSLog(@"task1----%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task2:%d",i);
//        }
//        NSLog(@"task2----%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task3:%d",i);
//        }
//        NSLog(@"task3----%@",[NSThread currentThread]);
//    });
//}

//3.异步任务+主队列
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //获取主队列
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    //创建异步任务
//    dispatch_async(mainQueue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task1:%d",i);
//        }
//        NSLog(@"task1----%@",[NSThread currentThread]);
//    });
//    dispatch_async(mainQueue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task2:%d",i);
//        }
//        NSLog(@"task2----%@",[NSThread currentThread]);
//    });
//    dispatch_async(mainQueue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task3:%d",i);
//        }
//        NSLog(@"task3----%@",[NSThread currentThread]);
//    });
//}

//4.同步任务+并行队列
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    //获取并行队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //同步执行
//    dispatch_sync(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task1:%d",i);
//        }
//        NSLog(@"task1----%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task2:%d",i);
//        }
//        NSLog(@"task2----%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task3:%d",i);
//        }
//        NSLog(@"task3----%@",[NSThread currentThread]);
//    });
//    
//}

//5.同步任务+串行队列
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    //创建串行队列
//    dispatch_queue_t queue = dispatch_queue_create("com.99ios", NULL);
//    //同步执行
//    dispatch_sync(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task1:%d",i);
//        }
//        NSLog(@"task1----%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task2:%d",i);
//        }
//        NSLog(@"task2----%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task3:%d",i);
//        }
//        NSLog(@"task3----%@",[NSThread currentThread]);
//    });
//    
//}

//6.同步任务+主队列
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //获取主队列
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    //同步执行
//    //1
//    dispatch_sync(mainQueue, ^{ //block 1
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task1:%d",i);
//        }
//        NSLog(@"task1----%@",[NSThread currentThread]);
//    });
//    //2
//    dispatch_sync(mainQueue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task2:%d",i);
//        }
//        NSLog(@"task2----%@",[NSThread currentThread]);
//    });
//    //3
//    dispatch_sync(mainQueue, ^{
//        for (int i = 0; i<2; i++) {
//            NSLog(@"task3:%d",i);
//        }
//        NSLog(@"task3----%@",[NSThread currentThread]);
//    });
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
