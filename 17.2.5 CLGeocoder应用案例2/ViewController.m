//
//  ViewController.m
//  17.2.5 CLGeocoder应用案例2
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *lngTextField;//经度
@property (weak, nonatomic) IBOutlet UITextField *latTextField;//纬度
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;//地址
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;//名称
@property (nonatomic,strong)CLGeocoder *geocoder;
@end

@implementation ViewController

- (CLGeocoder *)geocoder {
    if (_geocoder == nil) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (IBAction)reverseGeocode:(id)sender {
    double latitude  = [self.latTextField.text doubleValue];
    double longitude = [self.lngTextField.text doubleValue];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            //返回描述信息
            CLPlacemark *placemark = placemarks[0];
            //获取所需信息
            NSString *country = placemark.country;
            NSString *area = placemark.administrativeArea;
            NSString *city = placemark.locality;
            NSString *street = placemark.thoroughfare;
            //在textView上面显示
            self.addressTextField.text = [NSString stringWithFormat:@"%@ %@ %@ %@",country,area,city,street];
            self.nameTextField.text = placemark.name;
        }
    }];
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
