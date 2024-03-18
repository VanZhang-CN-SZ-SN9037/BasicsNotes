//
//  MYTableViewCell.m
//  8.2.14
//
//  Created by 李维佳 on 2017/4/1.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "MYTableViewCell.h"

@interface  MYTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MYTableViewCell

+(instancetype) cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"cell";
    MYTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //IB中创建cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MYTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

-(void)setCellData:(MYModel *)cellData{
    _cellData = cellData;
    self.contentLabel.text = cellData.content;
    
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
