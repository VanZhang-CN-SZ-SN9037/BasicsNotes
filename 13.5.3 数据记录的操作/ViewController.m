//
//  ViewController.m
//  13.5.3 sqlite3 的基本操作
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

- (BOOL)createTable {
    if (NULL == _db) {
        NSLog(@"数据库不存在，创建'联系人'表失败");
        return NO;
    }
    
    char *errMsg = NULL;
    // 拼接SQL语句
    const char *sql = "CREATE TABLE IF NOT EXISTS CONTACTS (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, phone TEXT)";
    
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) != SQLITE_OK) {
        NSLog( @"创建'联系人'表失败");
        return NO;
    }
    NSLog( @"创建'联系人'表成功");
    return YES;
}

- (BOOL)insertContact:(NSString *)name address:(NSString *)address phone:(NSString *)phone {
    if (NULL == _db) { //1
        NSLog(@"数据库不存在，添加联系人失败");
        return NO;
    }
    char *errMsg = NULL;
    // 拼接SQL语句
    NSString *sqlString = [NSString stringWithFormat:@"INSERT INTO CONTACTS (name, address, phone) VALUES ('%@', '%@', '%@');", name, address, phone]; //2
    const char *sql = [sqlString UTF8String];
    
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) != SQLITE_OK) { //3
        NSLog( @"添加联系人失败");
        return NO;
    }
    NSLog( @"添加联系人成功");
    return YES;
}

- (void)printAllContact {
    if (NULL == _db) { //1
        NSLog(@"数据库不存在:printAllContact");
        return;
    }
    // 拼接SQL语句
    const char *sql = "SELECT * FROM CONTACTS"; //2
    sqlite3_stmt *stmt = NULL;
    if (sqlite3_prepare_v2(_db, sql, -1, &stmt, nil) == SQLITE_OK) { //3
        while (sqlite3_step(stmt)==SQLITE_ROW) { //4
            char *name = (char *)sqlite3_column_text(stmt, 1); //5
            NSString *nameString = [[NSString alloc] initWithUTF8String:name];
            
            char *address = (char *)sqlite3_column_text(stmt, 2);
            NSString *addressString = [[NSString alloc] initWithUTF8String:address];
            
            char *phone = (char *)sqlite3_column_text(stmt, 3);
            NSString *phoneString = [[NSString alloc] initWithUTF8String:phone];
            
            NSLog(@"name: %@, address: %@, phone: %@", nameString, addressString, phoneString);
        }
        
        sqlite3_finalize(stmt); //6
    }
}

- (BOOL)deleteAllContactWithName:(NSString *)name {
    if (NULL == _db) { //1
        NSLog(@"数据库不存在，删除联系人失败");
        return NO;
    }
    char *errMsg = NULL;
    // 拼接SQL语句
    NSString *sqlString = [NSString stringWithFormat:@"DELETE FROM CONTACTS WHERE name='%@'", name]; //2
    const char *sql = [sqlString UTF8String];
    
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) != SQLITE_OK) { //3
        NSLog( @"删除联系人失败");
        return NO;
    }
    NSLog( @"删除联系人成功");
    return YES;
}

- (void)closeDB {
    if (NULL == _db) {
        NSLog(@"数据库不存在");
    } else {
        sqlite3_close(_db); // 关闭数据库
    }
}

- (BOOL)updatePhone:(NSString *)phone forContactWithName:(NSString *)name {
    if (NULL == _db) { //1
        NSLog(@"数据库不存在，更新联系人失败");
        return NO;
    }
    char *errMsg = NULL;
    // 拼接SQL语句
    NSString *sqlString = [NSString stringWithFormat:@"UPDATE CONTACTS SET phone = '%@' WHERE name='%@'", phone, name]; //2
    const char *sql = [sqlString UTF8String];
    
    if (sqlite3_exec(_db, sql, NULL, NULL, &errMsg) != SQLITE_OK) { //3
        NSLog( @"更新联系人失败");
        return NO;
    }
    NSLog( @"更新联系人成功");
    return YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openDatabaseWithName:@"99iOS.sqlite"];
    [self createTable];
    [self insertContact:@"liz" address:@"nanjing" phone:@"123"];
    [self insertContact:@"li" address:@"nanjing" phone:@"1234"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self printAllContact];
    [self deleteAllContactWithName:@"liz"];
    [self updatePhone:@"56789" forContactWithName:@"li"];
    [self printAllContact];
    [self closeDB];
}


@end
