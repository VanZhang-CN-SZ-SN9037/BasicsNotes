//
//  ViewController.m
//  11.3.2 线程间通信
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)downloadImage:(id)sender {
    //创建任务
    NSBlockOperation *downloadTask = [NSBlockOperation blockOperationWithBlock:^{
        //下载网络图片
        NSString *urlStr = @"http://7xta2c.com1.z0.glb.clouddn.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        //返回主线程设置UI
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperationWithBlock:^{
            self.imageView.image = image;
        }];
    }];
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:downloadTask];
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
