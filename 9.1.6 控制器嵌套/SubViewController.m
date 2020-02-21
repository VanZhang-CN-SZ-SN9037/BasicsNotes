//
//  SubViewController.m
//  9.1.6 控制器嵌套
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置子控制器view的属性
    self.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height * 0.5, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.5);
    self.view.backgroundColor = [UIColor greenColor];
    //添加一张图片
    UIImageView *iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"99ios"]];
    iconImage.frame = CGRectMake(128, 50, 128, 128);
    [self.view addSubview:iconImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
