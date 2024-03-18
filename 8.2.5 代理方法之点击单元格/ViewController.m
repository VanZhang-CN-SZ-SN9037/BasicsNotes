//
//  ViewController.m
//  8.2.5 代理方法之点击单元格
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation ViewController

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self; //设置数据源对象
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化cell
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //获取随机数据
    NSString *text = [NSString stringWithFormat:@"%d", arc4random_uniform(1000000)];
    //设值
    cell.textLabel.text = text;
    return cell;
}


//通知委托是否开启点击高亮显示
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//通知委托指定行被高亮显示
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"调用tableView:didHighlightRowAtIndexPath:方法");
}
//通知委托指定行不在高亮显示，一般是点击其他行的时候
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"调用tableView:didUnhighlightRowAtIndexPath:方法");
}
//通知委托指定行将要被选中，返回响应行的索引。
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"调用tableView:willSelectRowAtIndexPath:%@",indexPath);
    return indexPath;
}
//通知委托指定行将取消选中
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"调用tableView:willDeselectRowAtIndexPath:%@",indexPath);
    return indexPath;
}
//通知委托指定行被选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"调用tableView:didSelectRowAtIndexPath:方法");
}
//通知委托指定行被取消选中
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"调用tableView:didDeselectRowAtIndexPath:方法");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
