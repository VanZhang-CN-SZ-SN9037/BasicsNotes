//
//  ArchiveService.h
//  13.4.3 自定义对象归档、解档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface ArchiveService : NSObject

+ (BOOL) writeObjectToArchiveFile:(Person *) object;
+ (Person *) readObjectFromArchiveFile;

@end
