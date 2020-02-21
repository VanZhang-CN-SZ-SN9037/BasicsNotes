//
//  MYScrollView.m
//  10.3.2 UIPageControl实际应用
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "MYScrollView.h"

@implementation MYScrollView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat contentSizeWidth = [UIScreen mainScreen].bounds.size.width * 4;
        self.contentSize = CGSizeMake(contentSizeWidth, 0);
        self.contentOffset = CGPointZero;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
        self.clipsToBounds = NO;
        
        [self addImageView];
    }
    return self;
}

- (void) addImageView {
    for (int i = 0; i < 4; i++) {
        //获取到图片的宽度
        NSString *imageName = [NSString stringWithFormat:@"99logo_%02d.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        CGFloat imageWidth = image.size.width;
        CGFloat imageHeight = image.size.height;
        CGFloat imageWHRatio = imageWidth/imageHeight;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat imageViewX = i * screenWidth;
        //根据图片的实际宽度计算显示出来后图片的高度（不失真）
        CGFloat imageViewHeight = screenWidth / imageWHRatio;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, screenWidth, imageViewHeight)];
        imageView.image = image;
        //添加图片到scrollveiw
        [self addSubview:imageView];
    }
}

@end
