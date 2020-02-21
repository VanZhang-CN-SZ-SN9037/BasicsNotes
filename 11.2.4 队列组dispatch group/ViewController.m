//
//  ViewController.m
//  11.2.4 队列组dispatch group
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *task1ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *task2ImageView;
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@end

@implementation ViewController

- (IBAction)startTask:(id)sender {
    NSLog(@"0--%@", [NSThread currentThread]);
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    //创建并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建队列组中的第一个异步任务
    dispatch_group_async(group, queue, ^{
        NSLog(@"1.1--%@", [NSThread currentThread]);
        //下载网络图片
        NSString *urlStr = @"http://7xta2c.com1.z0.glb.clouddn.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        //返回主队列设置图片
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"1.2--%@", [NSThread currentThread]);
            self.task1ImageView.image = image;
        });
    });
    //创建队列组中的第二个异步任务
    dispatch_group_async(group, queue, ^{
        NSLog(@"2.1--%@", [NSThread currentThread]);
        //下载网络图片
        NSString *urlStr = @"http://7xta2c.com1.z0.glb.clouddn.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        //返回主队列设置图片
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"2.2--%@", [NSThread currentThread]);
            self.task2ImageView.image = image;
        });
    });
    //任务组中的任务完成后，执行的动作
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"3--%@", [NSThread currentThread]);
        self.taskLabel.text = @"下载完成";
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
