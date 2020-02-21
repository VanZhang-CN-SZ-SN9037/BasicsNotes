//
//  ViewController.m
//  10.6.2 UIDatePicker基本使用
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIDatePicker *datePicker;
@property(nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (UIDatePicker *)datePicker{
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 280, [UIScreen mainScreen].bounds.size.width, 200)];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventPrimaryActionTriggered];
        _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    }
    return _datePicker;
}

- (UIButton *)button{
    if (_button == nil) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        _button.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 500);
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        _button.backgroundColor = [UIColor blueColor];
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.datePicker];
    [self.view addSubview:self.button];
}
- (void)dateChange:(UIDatePicker*)picker{
//    NSString *currDate = ;
    
    NSLog(@"当前Picker选中:%@",[picker date]);
    [self show];
}
- (void)clickButton {
    [self show];
}
- (void)show{
    //获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected = [self.datePicker date];
    //创建一个日期格式器
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //为日期格式器设置格式字符串
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm +0800"];
    //使用日期格式器格式化日期和时间
    NSString *destDateString = [dateFormatter stringFromDate:selected];
    NSString *message = [NSString stringWithFormat:@"您选择的日期和时间是: %@",destDateString];
    //警告框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"日期和时间" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
