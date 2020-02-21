//
//  ArchiveService.h
//  13.4.4 归档多个自定义对象
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveService : NSObject

+ (BOOL) writeObjectsToArchiveFile:(NSArray *) array;
+ (NSMutableArray *) readObjectsFromArchiveFile;

@end
