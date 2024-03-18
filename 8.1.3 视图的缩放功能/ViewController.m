//
//  ViewController.m
//  8.1.3 视图的缩放功能
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView * imageView;
@end

@implementation ViewController
-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个与屏幕等宽等高的滚动视图
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //设置滚动区域的大小
    myScrollView.contentSize = self.imageView.bounds.size;
    //指定其代理对象
    myScrollView.delegate = self;
    //设置最小和最大缩放倍数
    myScrollView.minimumZoomScale = 0.3;
    myScrollView.maximumZoomScale = 3;
    //添加子视图
    [myScrollView addSubview:self.imageView];
    [self.view addSubview:myScrollView];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view{
    NSLog(@"图片即将开始被缩放。");
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    NSLog(@"图片缩放完成。");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"图片缩放过程中。");
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
