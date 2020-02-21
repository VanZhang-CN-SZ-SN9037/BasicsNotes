//
//  ViewController.h
//  11.2.3 线程间通信
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)downLoadImageView:(id)sender {
    //获取并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSLog(@"0---%@", [NSThread currentThread]);
    
    //异步任务
    dispatch_async(queue, ^{
        //从网络下载图片
        NSString *urlString = @"http://7xta2c.com1.z0.glb.clouddn.com/99logo.png";
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        NSLog(@"1---%@", [NSThread currentThread]);
        
        //返回主线程设置UI
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
            NSLog(@"2---%@", [NSThread currentThread]);
        });
        
    });
    
    NSLog(@"3---%@", [NSThread currentThread]);
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
