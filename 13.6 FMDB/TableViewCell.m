//
//  TableViewCell.m
//  13.6.2 更新操作与查询操作
//
//  Created by 李维佳 on 2017/4/26.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"cell";
    TableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //IB中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
