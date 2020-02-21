//
//  ArchiveService.m
//  13.4.2 单个对象归档、解档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ArchiveService.h"

@implementation ArchiveService
+ (BOOL) writeStringToArchiveFile:(NSString *) string {
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"string.archive"];
    //归档对象
    return  [NSKeyedArchiver archiveRootObject:string toFile:filePath];
}
+ (NSString *) readStringFromArchiveFile {
    //获取文件路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"string.archive"];
    //解档
    NSString *string = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return string;
}
@end
