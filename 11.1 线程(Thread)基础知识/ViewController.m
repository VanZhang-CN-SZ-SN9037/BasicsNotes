//
//  ViewController.m
//  11.1 线程(Thread)基础知识
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation ViewController

-(NSString *) generateString1{
    //阻塞主进程
    [NSThread sleepForTimeInterval:3.0];
    NSString *string = @"hello world!";
    return string;
}
-(NSString *) generateString2{
    //阻塞主进程
    [NSThread sleepForTimeInterval:3.0];
    NSString *string = @"www.99iOS.com!";
    return string;
}
-(NSString *) generateString3{
    //阻塞主进程
    [NSThread sleepForTimeInterval:3.0];
    NSString *string = @"2017!";
    return string;
}

- (IBAction)showContent:(id)sender {
    //记录开始时间
    NSLog(@"\n Start Time:%@, \n Current Thread: %@, \n Main Thread: %@", [NSDate date], [NSThread currentThread], [NSThread mainThread]);
    self.label1.text = [self generateString1];
    self.label2.text = [self generateString2];
    self.label3.text = [self generateString3];
    //记录结束时间
    NSLog(@"\n End Time:%@, \n Current Thread: %@, \n Main Thread: %@", [NSDate date], [NSThread currentThread], [NSThread mainThread]);
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
