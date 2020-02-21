//
//  FMDBService.h
//  13.7CoreData
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBService : NSObject
- (void)insertDataWithDictionary:(NSDictionary*)dict;
- (void)updateDataWithDictionary:(NSDictionary*)dict;
- (NSArray *)selectData;
- (void)deleteDataWithDictionary:(NSDictionary *)dict;
- (void)createTable;

@end
