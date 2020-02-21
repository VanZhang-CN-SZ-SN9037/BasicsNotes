//
//  ViewController.m
//  10.3.2 UIPageControl实际应用
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "MYScrollView.h" 
@interface ViewController ()
@property (nonatomic,strong) MYScrollView *myScrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property int currentImageIndex;
@end

@implementation ViewController

- (MYScrollView *)myScrollView {
    if (_myScrollView == nil) {
        //获取到图片的宽度
        UIImage *image = [UIImage imageNamed:@"99logo_00"];
        CGFloat imageWidth = image.size.width;
        CGFloat imageHeight = image.size.height;
        CGFloat imageWHRatio = imageWidth/imageHeight;
        //把图片添加到scrollView中，关键在于设置位置（平铺式的布局）
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        //根据图片的实际宽度计算显示出来后图片的高度（不失真）
        CGFloat imageViewHeight = screenWidth / imageWHRatio;
        _myScrollView = [[MYScrollView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width,imageViewHeight)];
    }
    return _myScrollView;
}

- (UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.frame = CGRectMake(0, 215, [UIScreen mainScreen].bounds.size.width, 37);
        _pageControl.numberOfPages = 4;
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        //监控用户对于pageControl的点击事件
        [_pageControl addTarget:self action:@selector(clickPageControl) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (void) clickPageControl {
    //根据点击的pageControl的值，来更新scrollview的contentoffset
    CGFloat x = [UIScreen mainScreen].bounds.size.width * self.pageControl.currentPage;
    [self.myScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    //更新一下currentImageIndex的值
    self.currentImageIndex = (int)self.pageControl.currentPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //为了明确图片位置，将view背景设置为灰色
    self.view.backgroundColor = [UIColor grayColor];
    //添加scrollView
    [self.view addSubview:self.myScrollView];
    //添加pageControl
    [self.view addSubview:self.pageControl];
    //应用一启动，就立即启动计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    self.currentImageIndex = 0;
}

- (void)changeImage {
    //更新pageControl的值
    self.pageControl.currentPage = self.currentImageIndex;
    //计算每次偏移的x值
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = screenWidth * self.currentImageIndex++;
    [self.myScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    //重新更新index的值
    if (self.currentImageIndex == 4) self.currentImageIndex = 0;
}
@end
