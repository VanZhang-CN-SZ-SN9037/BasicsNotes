//
//  SourceViewController.m
//  9.2.14 使用通知逆传数据
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
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"destinationVCReturn" object:nil];
}

- (void) receiveMessage:(NSNotification *) notification {
    NSString *string = (NSString *) notification.object;
    NSLog(@"目标控制器回传的字符串数据(使用通知)：%@",string);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DestinationViewController *descVC = [[DestinationViewController alloc] init];
    descVC.view.backgroundColor = [UIColor redColor];
    descVC.navigationItem.title = @"目标控制器";
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
