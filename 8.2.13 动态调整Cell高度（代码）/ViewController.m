//
//  ViewController.m
//  8.2.13 动态调整Cell高度（代码）
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "MYTableViewCell.h"
#import "MYModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,copy) NSMutableArray *dataArray;
@end

@implementation ViewController

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        for (int i=0; i < 10; i++) {
            MYModel *cellData = [MYModel myCellModel];
            [_dataArray addObject:cellData];
        }
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        //设置代理和数据源
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线与屏幕等宽
        _tableView.separatorInset = UIEdgeInsetsMake(1, 0, 1, 0);
        //分割线颜色
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark->delegate/dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYTableViewCell *cell = [MYTableViewCell cellWithTableView:tableView];
    cell.cellData = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYModel *cellData = self.dataArray[indexPath.row];
    return cellData.cellLabelHeight ;
}


@end
