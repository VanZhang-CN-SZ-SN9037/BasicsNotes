//
//  ViewController.m
//  14.2.4 截屏
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //开启一个图形上下文
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    //截屏
    if ([self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:NO]){
        NSLog(@"Successfully draw the screenshot."); }
    else{
        NSLog(@"Failed to draw the screenshot.");
    }
    //获取当前上下文
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(screenshot, self, nil, nil);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
