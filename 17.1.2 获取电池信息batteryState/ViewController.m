//
//  ViewController.m
//  17.1.2 获取电池信息batteryState
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
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES; //开启电池检测
    //注册通知，当充电状态改变时调用batteryStateChange方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryStateChange) name:UIDeviceBatteryStateDidChangeNotification object:nil];
}

- (void)dealloc {//移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) batteryStateChange {
    UIDevice *device = [UIDevice currentDevice];
    float batteryVolume = device.batteryLevel * 100;    //获取当前电量
    NSString *batteryVolumeString = [NSString stringWithFormat:@"当前电量：%.0f%%",batteryVolume];    //计算电池电量百分比
    switch (device.batteryState) {//根据电池状态切换时，给出提醒
        case UIDeviceBatteryStateUnplugged:{
            //提醒
            NSString *string = [NSString stringWithFormat:@"未充电，%@",batteryVolumeString];
            [self showAlert:string];
            break;}
        case UIDeviceBatteryStateCharging:{
            NSString *string = [NSString stringWithFormat:@"充电中，%@",batteryVolumeString];
            [self showAlert:string];
            break;
        }
        case UIDeviceBatteryStateFull:{
            NSString *string = [NSString stringWithFormat:@"已充满，%@",batteryVolumeString];
            [self showAlert:string];
            break;
        }
        case UIDeviceBatteryStateUnknown:{
            [self showAlert:@"未知状态"];
            break;
        }
        default:
            break;
    }
}

- (void) showAlert:(NSString *) string {
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertview show];
}

@end
