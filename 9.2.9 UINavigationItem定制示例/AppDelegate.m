//
//  AppDelegate.m
//  9.2.9 UINavigationItem定制示例
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *navRootVC = [[UIViewController alloc] init];
    navRootVC.view.backgroundColor = [UIColor grayColor];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:navRootVC];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeftBtn)];
    navRootVC.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"write_comment"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
    navRootVC.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    navRootVC.navigationItem.title = @"99iOS.com";
    
    navRootVC.navigationItem.prompt = @"苹果iOS开发进阶之路";
    
    navVC.navigationBar.tintColor = [UIColor redColor];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)clickLeftBtn{
    NSLog(@"%s",__func__);
}

- (void)clickRightBtn{
    NSLog(@"%s",__func__);
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
