//
//  ViewController.m
//  13.3.2 读写示例
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //[self updateData];
    [self readData];
    //[self deleteData];
}

//存储数据(新增/更新)
- (void)updateData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:@"LastLoginTime"];
    [defaults setBool:NO forKey:@"IsFirstLogin"];
    [defaults setValue:@"99iOS" forKey:@"UserName"];
    [defaults synchronize];
}
//读取数据
- (void)readData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *lastLoginTime = [defaults objectForKey:@"LastLoginTime"];
    BOOL isFirstLogin = [defaults boolForKey:@"IsFirstLogin"];
    NSString *userName = [defaults valueForKey:@"UserName"];
    NSLog(@"%@--%d--%@", lastLoginTime, isFirstLogin, userName);
}
//删除数据
- (void)deleteData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"LastLoginTime"];
}

@end
