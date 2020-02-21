//
//  ViewController.m
//  13.2.2 Plist文件的读取
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *arrayPistPath = [[NSBundle mainBundle] pathForResource:@"websites" ofType:@"plist"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithContentsOfFile:arrayPistPath];
    NSLog(@"%@",arrayM);
    
    NSString *dicPistPath = [[NSBundle mainBundle] pathForResource:@"website" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:dicPistPath];
    NSLog(@"%@",dict);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
