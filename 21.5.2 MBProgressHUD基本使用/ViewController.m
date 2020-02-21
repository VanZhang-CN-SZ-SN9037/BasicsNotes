//
//  ViewController.m
//  21.5.2 MBProgressHUD基本使用
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 VanZhang. All rights reserved.
//


#import "ViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

/*
 typedef NS_ENUM(NSInteger, MBProgressHUDMode) {
 MBProgressHUDModeIndeterminate,// 使用一个菊花图来显示进度，这是默认值
 MBProgressHUDModeDeterminate,//使用深色圆环作为进度视图
 MBProgressHUDModeDeterminateHorizontalBar,// 使用一个水平进度条
 MBProgressHUDModeAnnularDeterminate,// 使用浅色圆环作为进度视图
 MBProgressHUDModeCustomView, // 显示一个自定义视图
 MBProgressHUDModeText // 只显示文本
 };
 */



- (IBAction)indeterminateMode:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.bezelView.color = [UIColor greenColor];
    hud.bezelView.alpha = 0.5;
    hud.label.text = @"绿色的bezelView";
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self doSomeWork];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}


- (IBAction)determinateMode:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = @"正在加载...";
    hud.detailsLabel.textColor = [UIColor redColor];
    hud.detailsLabel.text = @"红色的副标题";
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        [self doSomeWorkWithProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

- (IBAction)annularDeterminateMode:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"正在加载...";
    hud.detailsLabel.text = @"黄色的backgroundView";
    hud.backgroundView.backgroundColor = [UIColor yellowColor];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        [self doSomeWorkWithProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

- (IBAction)determinateHorizontalBarMode:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text = @"正在加载...";
    hud.detailsLabel.text = @"添加了一个按钮";
    NSProgress *progressObject = [NSProgress progressWithTotalUnitCount:100];
    hud.progressObject = progressObject;
    [hud.button setTitle:@"取消加载" forState:UIControlStateNormal];
    [hud.button addTarget:progressObject action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    hud.button.backgroundColor = [UIColor blueColor];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [self doSomeWorkWithProgressObject:progressObject];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

- (IBAction)customViewMode:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"99logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.image = image;
    hud.customView = imageView;
    hud.label.text = @"VanZhang";
    hud.detailsLabel.text = @"苹果iOS开发进阶之路";
    hud.animationType = MBProgressHUDAnimationZoomIn;
    [hud hideAnimated:YES afterDelay:3.f];
}



- (void)doSomeWork {
    sleep(3.);
}

- (void)doSomeWorkWithProgress {
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD HUDForView:self.view].progress = progress;
        });
        usleep(50000);
    }
}

- (void)doSomeWorkWithProgressObject:(NSProgress *)progressObject {
    while (progressObject.fractionCompleted < 1.0f) {
        if (progressObject.isCancelled) break;
        [progressObject becomeCurrentWithPendingUnitCount:1];
        [progressObject resignCurrent];
        usleep(50000);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
