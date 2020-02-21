//
//  AppDelegate.h
//  13.5.1 数据库的操作
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

