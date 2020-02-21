//
//  DestinationViewController.h
//  9.2.15 使Block逆传数据
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 VanZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinationViewController : UIViewController
//声明一个名为PassDataBlock的block，无返回值，有一个NSString类型的参数
typedef void (^PassDataBlock)(NSString * dataText);
//供内部调用block
@property (copy) PassDataBlock block;
@property(nonatomic,copy)NSString *dataText;

@end
