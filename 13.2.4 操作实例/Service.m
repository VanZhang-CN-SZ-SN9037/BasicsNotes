//
//  Service.m
//  13.2.4 操作实例
//
//  Created by 李维佳 on 2017/4/4.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "Service.h"

@implementation Service
/*获取plist文件的路径*/
-(NSString *) personPlistFilePath {
    NSArray *documentArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [documentArray firstObject];
    NSString *personPlistFilePath = [documentPath stringByAppendingPathComponent:@"person.plist"];
    return personPlistFilePath;
}

-(void)addPersonWithDict:(NSDictionary *) dict{
    //获取Plist文件路径
    NSString *plistPath = [self personPlistFilePath];
    //检查Plist文件是否存在
    NSFileManager *fileManager= [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:plistPath]) { //文件不存在，则创建
        [fileManager createFileAtPath:plistPath contents:nil attributes:nil];
    }
    //读取Plist中的文件
    NSMutableArray *personArrayM = [NSMutableArray arrayWithContentsOfFile:plistPath];
    //判断arrayM是否为空,为空则创建
    if (personArrayM == nil) {
        personArrayM = [NSMutableArray array];
    }
    //传入的dict插入数组中
    [personArrayM addObject:dict];
    //写入文件
    [personArrayM writeToFile:plistPath atomically:YES];
}

-(NSArray *)readAllPerson{
    //获取Plist文件路径
    NSString *plistPath = [self personPlistFilePath];
    //读取Plist文件
    NSArray *personArray = [NSArray arrayWithContentsOfFile:plistPath];
    return personArray;
}
@end
