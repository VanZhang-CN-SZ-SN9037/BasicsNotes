//
//  NibView.h
//  7.2.10
//
//  Created by 李维佳 on 2017/3/31.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NibView : UIView
@property (weak, nonatomic) IBOutlet UIView *subView;
+(NibView *)initFromNib;
@end
