//
//  ViewController.m
//  7.2.3
//
//  Created by 李维佳 on 2017/3/29.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)move:(id)sender {
    CGPoint point = self.myView.center;
    point.x -=10;
    self.myView.center = point;
    NSLog(@"myview frame :%@",NSStringFromCGRect(self.myView.frame));
}

- (IBAction)scale:(id)sender {
    self.myView.transform = CGAffineTransformScale(self.myView.transform, 1.1, 1.1);
    NSLog(@"myview frame :%@",NSStringFromCGRect(self.myView.frame));
}

- (IBAction)rotate:(id)sender {
    self.myView.transform = CGAffineTransformRotate(self.myView.transform,M_PI_4);
    NSLog(@"myview frame :%@",NSStringFromCGRect(self.myView.frame));
}

- (IBAction)reset:(id)sender {
    self.myView.transform = CGAffineTransformIdentity;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
