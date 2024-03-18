//
//  ViewController.m
//  8.2.9 分段Section实现示例
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        //设置代理和数据源
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线与屏幕等宽
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //分割线颜色
        _tableView.separatorColor = [UIColor blackColor];
        //索引栏颜色
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        //索引文字颜色
        _tableView.sectionIndexColor = [UIColor redColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设定重用标识符
    static NSString *cellID = @"cellID";
    //重用机制
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"99iOS";
    cell.detailTextLabel.text = @"苹果iOS开发进阶之路";
    cell.imageView.image = [UIImage imageNamed:@"99logo"];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
//设置Section的header文字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *message = [NSString stringWithFormat:@"这是第 %ld 个Section头部视图",(long)section];
    return message;
}
//设置Section的footer文字
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSString *message = [NSString stringWithFormat:@"这是第 %ld 个Section底部视图",(long)section];
    return message;
}
//自定义头部、底部视图时会导致上面两个方法失效
//定制头部视图样式
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    headerView.backgroundColor = [UIColor orangeColor];
    return headerView;
}
//定制底部视图样式
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    footerView.backgroundColor = [UIColor greenColor];
    return footerView;
}
//索引样式定制
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"S0",@"S1",@"S2",@"S3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
