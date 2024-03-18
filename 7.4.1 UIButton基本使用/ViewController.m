//
//  ViewController.m
//  7.4.1
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#impøort "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton *myButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.myButton.backgroundColor = [UIColor yellowColor];
    [self.myButton addTarget:self action:@selector(myAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.myButton];
}

-(void)myAction{
    NSLog(@"%s",__func__);
}

- (IBAction)myAction:(id)sender {
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
