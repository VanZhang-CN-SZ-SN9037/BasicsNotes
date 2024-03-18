//
//  ViewController.m
//  8.2.12 动态调整Cell高度（self-sizing）
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "MYTableViewCell.h"
#import "MYModel.h"

@interface ViewController ()<UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *rowDataArray;
@end

@implementation ViewController

- (NSMutableArray *)rowDataArray {
    if (_rowDataArray == nil) {
        _rowDataArray = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            MYModel *model = [MYModel myCellModel];
            [_rowDataArray addObject:model];
        }
    }
    return _rowDataArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        //设置数据源
        _tableView.dataSource = self;
        //分割线与屏幕等宽
        _tableView.separatorInset = UIEdgeInsetsMake(1, 0, 1, 0);
        //分割线颜色
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.estimatedRowHeight = 127;
        _tableView.rowHeight = UITableViewAutomaticDimension;
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


#pragma mark->dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYTableViewCell *cell = [MYTableViewCell cellWithTableView:tableView];
    cell.cellData = self.rowDataArray[indexPath.row];
    return cell;
}

@end
