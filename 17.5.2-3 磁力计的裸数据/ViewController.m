//
//  ViewController.m
//  17.5.2-3 磁力计的裸数据
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (nonatomic, strong) CMMotionManager *motionMgr;
@end

@implementation ViewController
- (CMMotionManager *)motionMgr{
    if (_motionMgr == nil) {
        _motionMgr = [[CMMotionManager alloc ] init];
    }
    return _motionMgr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //Pull模式--磁力计
    if (self.motionMgr.isMagnetometerAvailable) {
        [self.motionMgr startMagnetometerUpdates];
    }else {
        NSLog(@"磁力计Magnetometer不可用");
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //获取磁力计当前状态
    CMMagneticField magneticField = self.motionMgr.magnetometerData.magneticField;
    NSLog(@"magnetometer current state: x:%f, y:%f, z:%f", magneticField.x,magneticField.y,magneticField.z);
}

- (IBAction)startMagneto:(id)sender {
    //设置采样间隔
    self.motionMgr.magnetometerUpdateInterval = 1.0;
    //开始采样
    [self.motionMgr startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMagnetometerData * _Nullable magnetometerData, NSError * _Nullable error) {
        NSLog(@"x:%f, y:%f, z:%f", magnetometerData.magneticField.x, magnetometerData.magneticField.y, magnetometerData.magneticField.z);
    }];
}

- (IBAction)stopMageto:(id)sender {
    [self.motionMgr stopMagnetometerUpdates];
}


@end
