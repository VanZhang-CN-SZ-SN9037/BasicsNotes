//
//  ViewController.m
//  7.2.6 响应用户交互事件
//
//  Created by VanZhang on 2020/2/26.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *myView;
@end

@implementation ViewController

-(UIView *)myView{
    if (_myView == nil) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _myView.backgroundColor = [UIColor redColor];
    }
    return _myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子视图
    [self.view addSubview:self.myView];
    //添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction)];
    [self.myView addGestureRecognizer:longPress];
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.myView addGestureRecognizer:tap];
    //打印所有的手势对象
    NSLog(@"myview gesture : %@", self.myView.gestureRecognizers);
}

-(void)longPressAction{
    NSLog(@"%s",__func__);
    if (@available(iOS 9,*)) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"长按了" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"%s",__func__);
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"长按了" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

-(void) tapAction {
    NSLog(@"%s",__func__);
    
    if (@available(iOS 9,*)) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"%s",__func__);
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }else{
     
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"点击了" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

/*配置View点击，作用域在于对象的frame范围内*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s ",__func__);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
