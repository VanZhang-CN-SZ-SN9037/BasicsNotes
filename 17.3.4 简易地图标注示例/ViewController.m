//
//  ViewController.m
//  17.3.4 简易地图标注示例
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
    // 添加mapView到控制器view
    [self.view addSubview:self.mapView];
    //实例化一个MKPointAnnotation类的对象，并添加到mapView上
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:self.mapView.centerCoordinate];
    [annotation setTitle:@"侵华日军南京大屠杀遇难同胞纪念馆"];
    [annotation setSubtitle:@"南京市建邺区水西门大街418号"];
    [self.mapView addAnnotation:annotation];
}




@end
