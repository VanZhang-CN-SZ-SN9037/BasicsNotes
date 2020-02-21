//
//  TableViewCell.h
//  13.6.2 更新操作与查询操作
//
//  Created by 李维佳 on 2017/4/26.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
+(instancetype) cellWithTableView:(UITableView *)tableview;
@end
