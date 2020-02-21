//
//  DetailViewController.m
//  13.6.2 更新操作与查询操作
//
//  Created by 李维佳 on 2017/4/26.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "DetailViewController.h"
#import "FMDBService.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(editItemSelect)];
    self.navigationItem.rightBarButtonItem = editItem;
    
    self.idTextField.text = self.dict[@"id"];
    self.nameTextField.text = self.dict[@"name"];
    self.sexTextField.text = self.dict[@"sex"];
    self.ageTextField.text = self.dict[@"age"];
    
    //主键不可编辑
    self.idTextField.userInteractionEnabled = NO;
    
    //注册通知，用来逆传
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upadteData:) name:@"update" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - upadteData
- (void)upadteData:(NSNotification *)notification {
    NSDictionary *dict = notification.object;
    self.idTextField.text = dict[@"id"];
    self.nameTextField.text = dict[@"name"];
    self.sexTextField.text = dict[@"sex"];
    self.ageTextField.text = dict[@"age"];
}


#pragma mark - editItemSelect
- (void)editItemSelect {
    NSDictionary *tmpDict = @{@"id" : self.idTextField.text, @"name": self.nameTextField.text, @"sex" : self.sexTextField.text, @"age" : self.ageTextField.text};
    
    FMDBService *fmdbService = [[FMDBService alloc] init];
    [fmdbService updateDataWithDictionary:tmpDict];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update" object:tmpDict];
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
