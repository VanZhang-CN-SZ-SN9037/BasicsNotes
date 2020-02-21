//
//  ViewController.m
//  11.3.3 任务间的执行依赖
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
  
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (IBAction)downloadTwoImage:(id)sender {
    //创建两个任务，两个任务完成后，返回主线程执行第三个更新Label的任务
    NSBlockOperation *task1 = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://7xta2c.com1.z0.glb.clouddn.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image1 = [UIImage imageWithData:imageData];
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.imageView1.image = image1;
        }];
    }];
    NSBlockOperation *task2 = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://7xta2c.com1.z0.glb.clouddn.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image2 = [UIImage imageWithData:imageData];
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.imageView2.image = image2;
        }];
    }];
    NSBlockOperation *task3 = [NSBlockOperation blockOperationWithBlock:^{
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.label.text = @"下载完成";
        }];
    }];
    //设置任务之间的执行依赖关系
    [task3 addDependency:task1];
    [task3 addDependency:task2];
    [task2 addDependency:task1];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:task1];
    [queue addOperation:task2];
    [queue addOperation:task3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




@end
