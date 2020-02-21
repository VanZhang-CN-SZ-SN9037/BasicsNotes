//
//  Service.h
//  13.2.4 操作实例
//
//  Created by 李维佳 on 2017/4/4.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Service : NSObject
-(void) addPersonWithDict:(NSDictionary *) dict;
-(NSArray *) readAllPerson;
@end
