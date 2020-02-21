//
//  ViewController.m
//  9.1.6 控制器嵌套
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@interface ViewController ()
@property (nonatomic, strong) SubViewController *subVC;
@end

@implementation ViewController

-(SubViewController *)subVC {
    if (_subVC == nil) {
        _subVC = [[SubViewController alloc] init];
        [self.view addSubview:_subVC.view];
    }
    return _subVC;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self addChildViewController:self.subVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
