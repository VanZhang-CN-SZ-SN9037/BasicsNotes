//
//  ViewController.m
//  7.2.5
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (IBAction)playAnimation:(id)sender {
    [UIView animateWithDuration:1.0 animations:^{
        self.myView.backgroundColor = [UIColor redColor];
        self.myView.transform = CGAffineTransformScale(self.myView.transform, 1.2,1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.myView.backgroundColor = [UIColor greenColor];
            self.myView.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
