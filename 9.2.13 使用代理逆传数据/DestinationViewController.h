//
//  DestinationViewController.h
//  9.2.13 使用代理逆传数据
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DestinationViewController;
@protocol DestinationViewControllerDelegate <NSObject>
-(void) destinationViewController:(DestinationViewController *) destinationViewController return2SrcVCWithData:(NSString *) string;
@end
@interface DestinationViewController : UIViewController
@property (nonatomic, weak) id <DestinationViewControllerDelegate> delegate;
@property(nonatomic,strong)NSString *dataText;
@end
