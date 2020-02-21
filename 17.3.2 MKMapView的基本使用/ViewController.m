//
//  ViewController.m
//  17.3.2 MKMapView的基本使用
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>
@property(nonatomic,strong) MKMapView *mapView;
@end

@implementation ViewController

- (MKMapView *)mapView{
    if (_mapView == nil) {
        //实例化mapView
        _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        //设置mapView的属性
        _mapView.mapType = MKMapTypeStandard;
        _mapView.delegate = self;
        _mapView.zoomEnabled = YES;
        _mapView.showsScale = YES;
        _mapView.showsCompass = YES;
        _mapView.showsTraffic = YES;
        //指定地图的中心点经纬度，我们也可以通过CoreLocation框架获取用户当前的坐标
        _mapView.centerCoordinate = CLLocationCoordinate2DMake(32.04, 118.76);
        //地图显示的范围
        MKCoordinateSpan span = {0.05,0.05};
        _mapView.region = MKCoordinateRegionMake(_mapView.centerCoordinate, span);
    }
    return _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mapView];
}


@end
