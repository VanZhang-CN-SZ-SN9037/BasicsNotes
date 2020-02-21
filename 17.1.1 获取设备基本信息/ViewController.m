//
//  ViewController.m
//  17.1.1 获取设备基本信息
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //获取当前设备对象
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"name: %@", device.name);
    NSLog(@"model:%@", device.model);
    NSLog(@"localizedModel: %@", device.localizedModel);
    NSLog(@"systemVersion: %@", device.systemVersion);
    //获取设备的UUID
    NSLog(@"identifierForVendor: %@", device.identifierForVendor.UUIDString);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
