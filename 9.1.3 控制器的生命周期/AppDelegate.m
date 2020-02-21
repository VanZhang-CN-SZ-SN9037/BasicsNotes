//
//  AppDelegate.m
//  9.1.3 控制器的生命周期
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "AppDelegate.h"

#import "CodeViewController.h"
#import "XibViewController.h"
#import "SBViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) CodeViewController *codeViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //使用代码创建一个控制器
    //        self.codeViewController = [[CodeViewController alloc] init];
    //        self.window.rootViewController = self.codeViewController;
    
    //使用xib创建控制器
//    XibViewController *xibVC = [[XibViewController alloc] initWithNibName:@"XibViewController" bundle:[NSBundle mainBundle]];
//    self.window.rootViewController = xibVC;
    
    //使用storyBoard创建控制器
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        SBViewController *sbVC = [storyBoard instantiateViewControllerWithIdentifier:@"SBViewController"];
        self.window.rootViewController = sbVC;
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
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
