//
//  ViewController.m
//  7.6 提示框控件
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"                                                                     message:@"是否要访问99iOS？"                                                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"YES"
                                                            style:UIAlertActionStyleDefault                                                              handler:^(UIAlertAction * action) {
                                                                NSLog(@"点击了YES");
                                                            }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"NO"
                                                           style:UIAlertActionStyleCancel                                                     handler:^(UIAlertAction *action) {
                                                               NSLog(@"点击了NO");
                                                           }];
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
