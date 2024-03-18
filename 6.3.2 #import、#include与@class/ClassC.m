//
//  ClassC.m
//  6.3.2
//
//  Created by 李维佳 on 2017/3/29.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ClassC.h"

@implementation ClassC
-(void) print {
    //NSLog(@"%@", self.classA.webSite);//报错
    NSLog(@"%@", self.classB.name);
}
@end
