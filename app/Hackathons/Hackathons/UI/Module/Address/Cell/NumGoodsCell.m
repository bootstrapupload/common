//
//  NumGoodsCell.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "NumGoodsCell.h"

@implementation NumGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (CGFloat)height{
    return 44;//+ 5;
}

+ (NSString *)cellId{
    return @"NumGoodsCell";
}


@end
