//
//  TableViewController.m
//  13.6.2 更新操作与查询操作
//
//  Created by 李维佳 on 2017/4/26.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "FMDBService.h"
#import "AddDataViewController.h"
#import "DetailViewController.h"
@interface TableViewController ()
@property (nonatomic, strong) NSArray *dataList;
@end

@implementation TableViewController

- (NSArray *)dataList {
    if (_dataList == nil) {
        FMDBService *fmdbService = [[FMDBService alloc] init];
        _dataList = [fmdbService selectData];
        
    }
    return _dataList;
}

- (void)viewWillAppear:(BOOL)animated {
    self.dataList = nil;
    [self.tableView reloadData];
    FMDBService *fmdbService = [[FMDBService alloc] init];
    [fmdbService createTable];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItemSelect)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    NSDictionary *dict = self.dataList[indexPath.row];
    cell.idLabel.text = dict[@"id"];
    cell.nameLabel.text = dict[@"name"];
    cell.sexLabel.text = dict[@"sex"];
    cell.ageLabel.text = dict[@"age"];
    return cell;
}

- (void)addItemSelect {
    AddDataViewController *addVC = [[AddDataViewController alloc] initWithNibName:@"AddDataViewController" bundle:nil];
    [self.navigationController pushViewController:addVC animated:YES];
}


#pragma mark - table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 145;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.dict = self.dataList[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        FMDBService *fmdbService = [[FMDBService alloc] init];
        [fmdbService deleteDataWithDictionary:self.dataList[indexPath.row]];
        self.dataList = nil;
        [self.tableView reloadData];
    }
}

@end
