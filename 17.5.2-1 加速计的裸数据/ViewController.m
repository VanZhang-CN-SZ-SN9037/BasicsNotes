//
//  ViewController.m
//  17.5.2-1 加速计的裸数据
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
    //Pull模式--加速计Accelerometer
    if (self.motionMgr.isAccelerometerAvailable) {
        //启动采样
        [self.motionMgr startAccelerometerUpdates];
    }else {
        NSLog(@"加速计Accelerometer不可用");
    }
}

- (IBAction)startAcc:(id)sender {
    //设置采样间隔
    self.motionMgr.accelerometerUpdateInterval = 1.0;
    //开始采样
    [self.motionMgr startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        NSLog(@"x:%f, y:%f, z:%f",accelerometerData.acceleration.x, accelerometerData.acceleration.y,accelerometerData.acceleration.z);
    }];
}

- (IBAction)stopAcc:(id)sender {
    [self.motionMgr stopAccelerometerUpdates];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //获取加速计当前状态
    CMAcceleration  acceleration = self.motionMgr.accelerometerData.acceleration;
    NSLog(@"accelerometer current state：x:%f, y:%f, z:%f", acceleration.x, acceleration.y, acceleration.z);
}


@end
