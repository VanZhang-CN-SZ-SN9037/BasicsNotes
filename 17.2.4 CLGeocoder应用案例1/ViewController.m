//
//  ViewController.m
//  17.2.4 CLGeocoder应用案例1
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;//地址
@property (weak, nonatomic) IBOutlet UITextField *lngTextField;//经度
@property (weak, nonatomic) IBOutlet UITextField *latTextField;//纬度
@property (nonatomic,strong) CLGeocoder *geocoder;
@end

@implementation ViewController

- (CLGeocoder *)geocoder {
    if (_geocoder == nil) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (IBAction)geocodeAddress:(id)sender {
    //判断用户输入地址的有效性
    NSString *address  = self.addressTextField.text;
    if ([address length] == 0) {
        return;
    }
    [self.geocoder geocodeAddressString:self.addressTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //判断是否有返回信息
        if ([placemarks count] > 0) {
            // placemarks数组中第一个为地标信息
            CLPlacemark *placemark = placemarks[0];
            //获得相应的经纬度
            CLLocationCoordinate2D coordinate = placemark.location.coordinate;
            //显示到对应的label上面
            self.latTextField.text = [NSString stringWithFormat:@"%3.5f",coordinate.latitude];
            self.lngTextField.text = [NSString stringWithFormat:@"%3.5f",coordinate.longitude];
        }
    }];
}



@end
