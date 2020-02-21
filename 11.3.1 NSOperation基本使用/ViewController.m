//
//  ViewController.m
//  11.3.1 NSOperation基本使用
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



//无队列情况下执行任务
/*
 调用operation的start方法，在当前线程中串行执行，无队列
 */
-(void) executeInCurrentThread {
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    //调用start方法，会在当前线程中串行执行
    [task1 start];
    [task2 start];
}

//在队列中执行任务
-(void) executeInQueue {
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task3-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task4-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task5-----%@", [NSThread currentThread]);
    }];
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //设置队列属性
    queue.maxConcurrentOperationCount = 5;
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
    [queue addOperation:task4];
    [queue addOperation:task5];
}

//在任务中添加新任务
-(void) addTaskInOperation {
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    //task1中添加task
    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    //task2中添加task
    [task2 addExecutionBlock:^{
        NSLog(@"task2 add task-----%@", [NSThread currentThread]);
    }];
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
}

//在队列中直接添加任务
-(void) addTaskInQueue {
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    //task1中添加task
    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    //task2中添加task
    [task2 addExecutionBlock:^{
        NSLog(@"task2 add task-----%@", [NSThread currentThread]);
    }];
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
    //在queue中添加任务
    [queue addOperationWithBlock:^{
        NSLog(@"queue task-----%@", [NSThread currentThread]);
    }];
}

//在任务中创建completionBlock
/*
 可以给任务Operation结束后添加block，但是block中的任务会在新的线程中执行，即：仅仅是添加了一个任务执行的先后顺序关系
 */
-(void) addCompletionBlock {
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task2-----%@", [NSThread currentThread]);
    }];
    //task1中添加task
    [task1 addExecutionBlock:^{
        NSLog(@"task1 add task-----%@", [NSThread currentThread]);
    }];
    task1.completionBlock = ^{
        NSLog(@"task1 end!!! %@", [NSThread currentThread]);
    };
    //task2中添加task
    [task2 addExecutionBlock:^{
        NSLog(@"task2 add task-----%@", [NSThread currentThread]);
    }];
    task2.completionBlock = ^{
        NSLog(@"task2 end!!! %@", [NSThread currentThread]);
    };
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //添加任务到队列
    [queue addOperation:task1];
    [queue addOperation:task2];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self executeInCurrentThread];
    //    [self executeInQueue];
    //    [self addTaskInOperation];
    //    [self addTaskInQueue];
    //    [self addCompletionBlock];
}


@end
