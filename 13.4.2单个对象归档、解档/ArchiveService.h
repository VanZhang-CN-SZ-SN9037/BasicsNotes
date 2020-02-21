//
//  ArchiveService.h
//  13.4.2 单个对象归档、解档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveService : NSObject
+ (BOOL) writeStringToArchiveFile:(NSString *) string;
+ (NSString *) readStringFromArchiveFile;
@end
