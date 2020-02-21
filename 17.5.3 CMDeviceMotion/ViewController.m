//
//  ViewController.m
//  17.5.3 CMDeviceMotion
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
    //Pull模式--device motion
    if (self.motionMgr.isDeviceMotionAvailable) {
        [self.motionMgr startDeviceMotionUpdates];
    }else {
        NSLog(@"device motion不可用");
    }
    //Pull模式--陀螺仪
    if (self.motionMgr.isGyroAvailable) {
        [self.motionMgr startGyroUpdates];
    }else {
        NSLog(@"陀螺仪GyroScope不可用");
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //通过deviceMotion获取陀螺仪当前状态
    CMDeviceMotion * deviceMotion = self.motionMgr.deviceMotion;
    NSLog(@"device motion rationRate: x:%f, y:%f, z:%f",deviceMotion.rotationRate.x, deviceMotion.rotationRate.y,deviceMotion.rotationRate.z);
    //获取陀螺仪当前状态
    CMRotationRate rationRate = self.motionMgr.gyroData.rotationRate;
    NSLog(@"gyroscope current state: x:%f, y:%f, z:%f", rationRate.x, rationRate.y, rationRate.z);
}


- (IBAction)startDeviceMotion:(id)sender {
    //设置采样间隔
    self.motionMgr.deviceMotionUpdateInterval = 1.0;
    //开始采样
    [self.motionMgr startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        NSLog(@"x:%f, y:%f, z:%f", motion.rotationRate.x, motion.rotationRate.y, motion.rotationRate.z);
    }];
}

- (IBAction)stopDeviceMotion:(id)sender {
    [self.motionMgr stopDeviceMotionUpdates];
}

@end
