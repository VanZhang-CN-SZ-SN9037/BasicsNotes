//
//  MyTableViewCell.h
//  8.2.17
//
//  Created by 李维佳 on 2017/4/2.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYModel.h"
@interface MYTableViewCell : UITableViewCell
@property(nonatomic,strong)MYModel *cellData;
+(instancetype) cellWithTableView:(UITableView *)tableview;
@end
