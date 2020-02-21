//
//  Student.h
//  13.4.5 子类对象的归档
//
//  Created by 李维佳 on 2017/4/5.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "Person.h"
@interface Student : Person <NSCoding>
@property (nonatomic, strong) NSString *score;
@end
