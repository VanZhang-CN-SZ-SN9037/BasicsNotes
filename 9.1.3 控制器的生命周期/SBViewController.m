


//
//  SBViewController.m
//  9.1.3 控制器的生命周期
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "SBViewController.h"

#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
@interface SBViewController ()

@end

@implementation SBViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%s",__func__);
    }
    return self;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",__func__);
}

-(void)loadView{
    NSLog(@"%s",__func__);
    [super loadView];
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
