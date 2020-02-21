//
//  AppDelegate.m
//  9.3.4 微信TabBar实现
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //微信
    UIViewController *homeVC = [[UIViewController alloc] init];
    homeVC.title = @"微信";
    UINavigationController *homeNaviVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UITabBarItem *item0 = [[UITabBarItem alloc] initWithTitle:homeVC.title image:[UIImage imageNamed:@"tabbar_mainframe"] selectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    homeNaviVC.tabBarItem = item0;
    
    //通讯录
    UIViewController *contactVC = [[UIViewController alloc] init];
    contactVC.title = @"通讯录";
    UINavigationController *contactNaviVC = [[UINavigationController alloc] initWithRootViewController:contactVC];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:contactVC.title image:[UIImage imageNamed:@"tabbar_contacts"] selectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    contactNaviVC.tabBarItem = item1;
    
    //发现
    UIViewController *discoverVC = [[UIViewController alloc] init];
    discoverVC.title = @"发现";
    UINavigationController *discoverNaviVC = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:discoverVC.title image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    discoverNaviVC.tabBarItem = item2;
    
    //我
    UIViewController *myVC = [[UIViewController alloc] init];
    myVC.title = @"我";
    UINavigationController *myNaviVC = [[UINavigationController alloc] initWithRootViewController:myVC];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:myVC.title image:[UIImage imageNamed:@"tabbar_me"] selectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    myNaviVC.tabBarItem = item3;
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[homeNaviVC, contactNaviVC, discoverNaviVC,myNaviVC];
    tabBarVC.selectedViewController = homeNaviVC;
    
    tabBarVC.tabBar.backgroundImage = [UIImage imageNamed:@"tabbarBkg"];
    //设置选中时文字颜色
    tabBarVC.tabBar.tintColor = [UIColor colorWithRed:31/255.0 green:185/255.0 blue:34/255.0 alpha:1.0];
    
    //选中时使用原图片
    for (UITabBarItem *item in tabBarVC.tabBar.items) {
        UIImage *image = item.selectedImage;
        UIImage *correctImage =[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = correctImage;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarVC;
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
