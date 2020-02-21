//
//  ViewController.m
//  16.2 Masonry
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"


#import <Masonry/Masonry.h>
@interface ViewController ()
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@end


@implementation ViewController
#pragma mark - Getter
- (UIView *)yellowView {
    if (nil == _yellowView) {
        _yellowView = [[UIView alloc] init];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}

- (UIView *)greenView {
    if (nil == _greenView) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}

- (UIView *)redView {
    if (nil == _redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.redView];
    [self makeContstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateViewConstraints {
    [self makeContstraints];
    [super updateViewConstraints];
}
- (void)makeContstraints{
    [self.yellowView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.equalTo(@20);
        make.width.equalTo(self.greenView);
        make.trailing.equalTo(self.greenView.mas_leading).offset(-20);
    }];
    
    [self.greenView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.trailing.equalTo(@(-20));
        make.width.equalTo(self.yellowView);
        make.leading.equalTo(self.yellowView.mas_trailing).offset(20);
    }];
    
    [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@20);
        make.bottom.and.trailing.equalTo(@(-20));
        make.top.equalTo(@[self.yellowView.mas_bottom,self.greenView.mas_bottom]).offset(20);
        make.height.equalTo(@[self.yellowView, self.greenView]);
    }];
    
}



@end
