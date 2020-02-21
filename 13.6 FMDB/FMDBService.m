//
//  FMDBService.m
//  13.7CoreData
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "FMDBService.h"
#import "fmdb/FMDB.h"
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
@implementation FMDBService
static FMDatabaseQueue *queue;
static NSMutableArray *array;
//获取文件路径
- (NSString*)path {
    return  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"mySqlite.sqlite"];
}
//建表
- (void)createTable {
    FMDatabase *database = [FMDatabase databaseWithPath:[self path]];
    if ([database open]) {
        NSString *sqlCreateTable =  @"CREATE TABLE IF NOT EXISTS person (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, sex text, age TEXT)";
        if (![database executeUpdate:sqlCreateTable]) {
            NSLog(@"error when creating db table");
        } else {
            NSLog(@"success to creating db table");
        }
        [database close];
    }else{
        NSLog(@"open failed");
    }
}

//插入数据
- (void)insertDataWithDictionary:(NSDictionary*)dict {
    FMDatabase *database = [FMDatabase databaseWithPath:[self path]];
    if ([database open]) {
//                [self createTable];
        NSString *insertSql = [NSString stringWithFormat:@"insert into person(id,name,sex,age) values(%ld,'%@','%@','%@')",[dict[@"id"] integerValue],dict[@"name"],dict[@"sex"],dict[@"age"]];
        if ([database executeUpdate:insertSql]) {
            NSLog(@"insert success");
        }else{
            NSLog(@"insert failed");
        }
        [database close];//执行操作之后关闭
    }else{
        NSLog(@"open failed");
    }
}
//更新数据
- (void)updateDataWithDictionary:(NSDictionary*)dict {
    FMDatabase *database = [FMDatabase databaseWithPath:[self path]];
    if ([database open]) {
        if ([database executeUpdate:@"update person set name = ?,sex = ?,age = ? where id = ?",dict[@"name"],dict[@"sex"],dict[@"age"],[NSNumber numberWithInteger:[dict[@"id"] integerValue]]]) {
            NSLog(@"update success");
        }else{
            NSLog(@"%@",[database lastError]);
        }
        [database close];
    }else{
        NSLog(@"open failed");
    }
}
//查询数据
- (NSArray *)selectData {
    if (array == nil) {
        array = [NSMutableArray array];
    }else {
        [array removeAllObjects];
    }
    FMDatabase *database = [FMDatabase databaseWithPath:[self path]];
    if ([database open]) {
        NSString *str = @"select * from person";
        FMResultSet *rs = [database executeQuery:str];
        while ([rs next]) {
            NSDictionary *dict = @{
                                   [rs columnNameForIndex:0] : [NSString stringWithFormat:@"%d", [rs intForColumnIndex:0]],
                                   [rs columnNameForIndex:1] : [rs stringForColumnIndex:1],
                                   [rs columnNameForIndex:2] : [rs stringForColumnIndex:2],
                                   [rs columnNameForIndex:3] : [rs stringForColumnIndex:3]};
            [array addObject:dict];
        }
        [database close];
    }else {
        NSLog(@"open failed");
    }
    return array;
}
//删除数据
- (void)deleteDataWithDictionary:(NSDictionary *)dict {
    FMDatabase *database = [FMDatabase databaseWithPath:[self path]];
    if ([database open]) {
        NSLog(@"open success");
        // 使用？去占位时需要传入OC对象
        if ([database executeUpdate:@"delete from person where id = ?", [NSNumber numberWithInteger:[dict[@"id"] integerValue]]]) {
            NSLog(@"delete success");
        } else {
            NSLog(@"delete failed");
        }
        [database close];
    } else {
        NSLog(@"open failed");
    }
}
@end
