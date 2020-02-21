//
//  ViewController.m
//  17.1.4 方向传感器orientation
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *orientationLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIDevice *device = [UIDevice currentDevice];
    //开启方向改变通知
    [device beginGeneratingDeviceOrientationNotifications];
    //注册方向改变通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void) orientationChange{
    UIDevice *device = [UIDevice currentDevice];
    switch (device.orientation) {
        case UIDeviceOrientationPortrait:
            self.orientationLabel.text = [NSString stringWithFormat:@"竖屏/正常"];
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            self.orientationLabel.text = [NSString stringWithFormat:@"竖屏/倒置"];
            break;
        case UIDeviceOrientationLandscapeLeft:
            self.orientationLabel.text = [NSString stringWithFormat:@"横屏/左侧"];
            break;
        case UIDeviceOrientationLandscapeRight:
            self.orientationLabel.text = [NSString stringWithFormat:@"横屏/右侧"];
            break;
        case UIDeviceOrientationFaceUp:
            self.orientationLabel.text = [NSString stringWithFormat:@"正面朝上"];
            break;
        case UIDeviceOrientationFaceDown:
            self.orientationLabel.text = [NSString stringWithFormat:@"正面朝下"];
            break;
        default:
            self.orientationLabel.text = [NSString stringWithFormat:@"未知朝向"];
            break;
    }
}

-(void)dealloc {
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
