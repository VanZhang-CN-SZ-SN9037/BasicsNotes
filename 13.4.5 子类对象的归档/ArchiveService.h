//
//  ArchiveService.h
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface ArchiveService : NSObject
+ (BOOL) writeSubObjectToArchiveFile:(Student *) object;
+ (Student *) readSubObjectFromArchiveFile;
@end
