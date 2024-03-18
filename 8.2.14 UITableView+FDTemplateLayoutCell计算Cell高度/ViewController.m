//
//  ViewController.m
//  8.2.14 UITableView+FDTemplateLayoutCell计算Cell高度
//
//  Created by VanZhang on 2020/2/21.
//  Copyright © 2020 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "MYTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MYModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *array;
@end

@implementation ViewController

- (NSMutableArray *)array{
    if (_array == nil) {
        _array = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            MYModel *cellModel =[MYModel myCellModel];
            [_array addObject:cellModel];
        }
    }
    return _array;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        //设置代理和数据源
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //注册单元格
        [_tableView registerNib:[UINib nibWithNibName:@"MYTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYTableViewCell *cell = [MYTableViewCell cellWithTableView:tableView];
    cell.cellData = self.array[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_tableView fd_heightForCellWithIdentifier:@"cellId" configuration:^(MYTableViewCell *cell) {
        [cell setCellData:self.array[indexPath.row]];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
