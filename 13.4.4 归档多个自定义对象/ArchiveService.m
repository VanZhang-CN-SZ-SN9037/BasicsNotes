//
//  ArchiveService.m
//  13.4.4 归档多个自定义对象
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService
+ (BOOL) writeObjectsToArchiveFile:(NSArray *) array{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"persons.archive"];
    
    //归档
    return  [NSKeyedArchiver archiveRootObject:array toFile:filePath];
}

+ (NSMutableArray *) readObjectsFromArchiveFile{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"persons.archive"];
    //解档
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return array;
}

@end
