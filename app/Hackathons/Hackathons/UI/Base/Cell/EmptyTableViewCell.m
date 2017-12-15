//
//  EmptyTableViewCell.m
//  health
//
//  Created by XuQuan on 09/10/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "EmptyTableViewCell.h"

@implementation EmptyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (NSString *)cellId{
    return @"EmptyTableViewCell";
}
+ (CGFloat)height{
    return 100;
}

- (void)setDataInfo:(NSObject *)obj{
    //    if (![obj isKindOfClass:[JYTOrgModel class]]) {
    //        return;
    //    }
    //    self.orgName.text = obj.orgName;
    //    self.goodRate.text = NSStringFormat(@"%.2f%%",obj.goodRatio*100);
    //    self.orgDistance.text = @"";
    //    self.orgDoctorInfo.text = NSStringFormat(@"%ld位医生 / %ld次累计诊疗",obj.doctorNum,obj.clinicNum);
}
@end
