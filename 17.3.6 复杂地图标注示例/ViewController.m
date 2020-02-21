//
//  ViewController.m
//  17.3.6 复杂地图标注示例
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import<MapKit/MapKit.h>
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


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKAnnotationView *customAnnotationView = (MKAnnotationView*)[mapView                                                                   dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (customAnnotationView == nil){
            customAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation                                                            reuseIdentifier:@"CustomPinAnnotationView"];
        }
        //设置标注的图片
        customAnnotationView.image = [UIImage imageNamed:@"99logo"];
        //设置点击标注可以显示更多信息
        customAnnotationView.canShowCallout = YES;
        //右侧按钮定制
        UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        rightButton.backgroundColor = [UIColor redColor];
        [rightButton setTitle:@"前往" forState:UIControlStateNormal];
        customAnnotationView.rightCalloutAccessoryView = rightButton;
        //左侧按钮定制
        UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        leftButton.backgroundColor = [UIColor blueColor];
        [leftButton setTitle:@"详情" forState:UIControlStateNormal];
        customAnnotationView.leftCalloutAccessoryView = leftButton;
        return customAnnotationView;
    }
    return nil;
}



@end
