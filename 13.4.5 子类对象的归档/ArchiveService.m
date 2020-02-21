//
//  ArchiveService.m
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService
+ (BOOL) writeSubObjectToArchiveFile:(Student *) object{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"student.archive"];
    //调用NSKeyedArchiver的类方法archiveRootObject:toFile:将对象归档（返回一个布尔值）
    return  [NSKeyedArchiver archiveRootObject:object toFile:filePath];
}

+ (Student *) readSubObjectFromArchiveFile{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"student.archive"];
    //调用NSKeyedUnarchiver的类方法unarchiveObjectWithFile:将文件解档
    Student *student = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return student;
}

@end
