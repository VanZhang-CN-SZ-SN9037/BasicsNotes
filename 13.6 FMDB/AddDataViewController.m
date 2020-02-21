//
//  AddDataViewController.m
//  13.6.2 更新操作与查询操作
//
//  Created by 李维佳 on 2017/4/26.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "AddDataViewController.h"
#import "FMDBService.h"
@interface AddDataViewController ()

@end

@implementation AddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItemSelect)];
    self.navigationItem.rightBarButtonItem = saveItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveItemSelect {
    NSDictionary *dict = @{
                           @"id" : self.idTextField.text,
                           @"name" : self.nameTextField.text,
                           @"sex" : self.sexTextField.text,
                           @"age" : self.ageTextField.text
                           };
    FMDBService *fmdbService = [[FMDBService alloc] init];
    [fmdbService insertDataWithDictionary:dict];
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
