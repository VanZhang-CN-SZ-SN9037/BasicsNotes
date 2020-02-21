//
//  SourceViewController.m
//  9.2.12 顺传数据
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "SourceViewController.h"
#import "DestinationViewController.h"
@interface SourceViewController ()

@end

@implementation SourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DestinationViewController *descVC = [[DestinationViewController alloc] init];
    descVC.view.backgroundColor = [UIColor redColor];
    descVC.navigationItem.title = @"目标控制器";
    
    //跳转前传递数据
    descVC.dataText = @"99iOS.com";
    
    //控制器跳转
    [self.navigationController pushViewController:descVC animated:YES];
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
