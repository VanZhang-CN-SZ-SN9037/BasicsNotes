//
//  ViewController.m
//  13.5.1 数据库的操作
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"

#import <sqlite3.h>

@interface ViewController ()
@property (nonatomic, assign) sqlite3 *db;
@end

@implementation ViewController

- (BOOL)openDatabaseWithName:(NSString *)databaseName {
    NSString *docsDir = nil;
    NSArray *dirPath = nil;
    
    // 获取文档目录路径
    dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPath objectAtIndex:0];
    
    // 拼接数据库路径
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: databaseName]];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    const char *dbPath = [databasePath UTF8String];
    if (![fileManager fileExistsAtPath: databasePath ]) {
        if (sqlite3_open(dbPath, &_db) == SQLITE_OK) {
            NSLog( @"数据库 打开/创建 成功：%@", databasePath);
            return YES;
        }
        else {
            NSLog( @"数据库 打开/创建 失败：%@", databasePath);
            return NO;
        }
    }else{
        NSLog(@"数据库已创建: %@", databasePath);
        if (sqlite3_open(dbPath, &_db) == SQLITE_OK) {
            NSLog( @"数据库 打开/创建 成功：%@", databasePath);
            return YES;
        }
        else {
            NSLog( @"数据库 打开/创建 失败：%@", databasePath);
            return NO;
        }
        return YES;
    }
}

- (void)closeDB {
    if (NULL == _db) {
        NSLog(@"数据库不存在");
    } else {
        sqlite3_close(_db); // 关闭数据库
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openDatabaseWithName:@"99iOS.sqlite"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self closeDB];
}



@end
