//
//  Person.h
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

+(instancetype)personWithDict:(NSDictionary *) dict;

@end
