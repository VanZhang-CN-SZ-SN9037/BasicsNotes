//
//  XibViewController.m
//  9.1.3 控制器的生命周期
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "XibViewController.h"
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
@interface XibViewController ()

@end

@implementation XibViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    NSLog(@"%s",__func__);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)loadView{
    NSLog(@"%s",__func__);
    [super loadView];
    
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidLoad {
    NSLog(@"%s",__func__);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__func__);
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s",__func__);
}

-(void)viewWillLayoutSubviews{
    NSLog(@"%s",__func__);
}

-(void)viewDidLayoutSubviews{
    NSLog(@"%s",__func__);
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"%s",__func__);
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
