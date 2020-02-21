//
//  ViewController.m
//  10.4.2 UIPickerView的基本使用
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UIPickerView *pickerView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"北京",@"天津",@"南京",@"上海",@"唐山",@"重庆"];
    }
    return _dataArray;
}

- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 400)];
        _pickerView.layer.masksToBounds = YES;
        _pickerView.layer.borderWidth = 1;
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pickerView.bounds)+100, [UIScreen mainScreen].bounds.size.width, 30)];
        _label.backgroundColor = [UIColor yellowColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = self.dataArray[0];
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pickerView];
    [self.view addSubview:self.label];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.dataArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.label.text = self.dataArray[row];
}


@end
