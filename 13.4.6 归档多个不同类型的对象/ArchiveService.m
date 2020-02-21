//
//  ArchiveService.m
//  13.4.6 归档多个不同类型的对象
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ArchiveService.h"
#import "Person.h"
@implementation ArchiveService

+ (void) writeMultiTypesObjectsToArchiveFile{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"multitypesObjects.archive"];
    //创建一个MutableData对象用于存放需要归档的数据
    NSMutableData *archiveData = [NSMutableData data];
    //创建一个NSKeyedArchiver类的对象archiver，用来对归档对象进行编码，编码完成才能进行归档
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:archiveData];
    //归档基本数据类型
    [archiver encodeInt:2 forKey:@"int"];
    [archiver encodeObject:@"99iOS" forKey:@"string"];
    //归档自定义类
    Person *person = [[Person alloc] init];
    person.name = @"99iOS";
    [archiver encodeObject:person forKey:@"person"];
    //完成编码
    [archiver finishEncoding];
    //将archiveData对象写入文件，完成归档
    [archiveData writeToFile:filePath atomically:YES];
}

+ (void) readSMultiTypesObjectsFromArchiveFile{
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"multitypesObjects.archive"];
    //创建NSData对象来接收解档文件
    NSData *unarchiveData = [NSData dataWithContentsOfFile:filePath];
    //创建一个NSKeyedUnarchiver对象unarchiver，用来对需要解档的对象进行解码，解码后就能还原原对象的数据类型
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:unarchiveData];
    //解档对象
    int number = [unarchiver decodeIntForKey:@"int"];
    NSString *string = [unarchiver decodeObjectForKey:@"string"];
    Person *person = [unarchiver decodeObjectForKey:@"person"];
    //打印
    NSLog(@"number = %d, string = %@, person name = %@", number, string, person.name);
}

@end
