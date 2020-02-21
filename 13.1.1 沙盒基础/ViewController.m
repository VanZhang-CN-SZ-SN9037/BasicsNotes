//
//  ViewController.m
//  13.1.1 沙盒基础
//
//  Created by 李维佳 on 2017/4/4.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *homePath = NSHomeDirectory();
    NSLog(@"沙盒路径：%@", homePath);
    
    NSArray *documentsArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [documentsArr objectAtIndex:0];
    NSLog(@"%@", documentsPath);
    
    NSArray *libraryArr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libraryArr objectAtIndex:0];
    NSLog(@"%@", libraryPath);
    
    NSArray *cachesArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesPath = [cachesArr objectAtIndex:0];
    NSLog(@"%@", cachesPath);
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@", tmpPath);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
