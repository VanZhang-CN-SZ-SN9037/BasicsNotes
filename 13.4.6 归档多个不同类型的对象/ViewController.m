//
//  ViewController.m
//  13.4.6 归档多个不同类型的对象
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import "ViewController.h"
#import "ArchiveService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ArchiveService writeMultiTypesObjectsToArchiveFile];
    [ArchiveService readSMultiTypesObjectsFromArchiveFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
