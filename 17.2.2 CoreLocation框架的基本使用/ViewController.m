//
//  ViewController.m
//  17.2.2 CoreLocation框架的基本使用
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lngTextField;
@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation ViewController

- (CLLocationManager *)locationManager{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//精度设置
        _locationManager.distanceFilter = 1000.0f;//设备移动后获得位置信息的最小距离
        _locationManager.delegate = self;
        [_locationManager requestWhenInUseAuthorization];//弹出用户授权对话框，使用程序期间授权
    }
    return _locationManager;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    self.lngTextField.text = [NSString stringWithFormat:@"%3.5f",self.locationManager.location.coordinate.longitude];//获取经度
    self.latTextField.text = [NSString stringWithFormat:@"%3.5f",self.locationManager.location.coordinate.latitude];//获取纬度
    self.heightTextField.text = [NSString stringWithFormat:@"%3.5f",self.locationManager.location.altitude];//获取高度
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
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
