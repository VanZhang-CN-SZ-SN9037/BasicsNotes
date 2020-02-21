//
//  ViewController.h
//  12.8Reachability检测网络状态
//
//  Created by Mac on 2018/11/11.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注册通知(获取当前网络环境)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange:) name:kReachabilityChangedNotification object:nil];
    
    //启动
    Reachability *reach  = [Reachability reachabilityWithHostname:@"www.99ios.com"];
    [reach startNotifier];
    
}

-(void)networkStateChange:(NSNotification *) notification{
    
    Reachability *reach = (Reachability *)[notification object];
    
    NetworkStatus status = [reach currentReachabilityStatus];
    
    switch (status) {
        case ReachableViaWWAN:{
            NSLog(@"正在使用3G/4G网络");
            break;
        }
        case ReachableViaWiFi:{
            NSLog(@"正在使用WIFI");
            break;
        }
        case NotReachable:{
            NSLog(@"未知或无网络");

            break;
        }
        default:
            break;
    }
}

- (IBAction)currentNetworkState:(id)sender {
    
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.99ios.com"];
    
    NetworkStatus status = [reach currentReachabilityStatus];
    
    NSLog(@"%ld", (long)status);
    
    
}


@end
