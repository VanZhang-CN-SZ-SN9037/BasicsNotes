//
//  ArchiveService.m
//  13.4.3 自定义对象归档、解档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService
+ (BOOL) writeObjectToArchiveFile:(Person *) object {
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"person.archive"];
    
    //调用NSKeyedArchiver的类方法archiveRootObject:toFile:将对象归档（返回一个布尔值）
    return  [NSKeyedArchiver archiveRootObject:object toFile:filePath];
    
}

+ (Person *) readObjectFromArchiveFile {
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"person.archive"];
    //调用NSKeyedUnarchiver的类方法unarchiveObjectWithFile:将文件解档
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return person;
}

@end
