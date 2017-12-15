//
//  HomeCell.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HomeCell.h"
#import "GoodsModel.h"

@interface HomeCell()
@end
@implementation HomeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = C4;
        self.clipsToBounds = YES;
        self.contentView.clipsToBounds = YES;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (CGFloat)height{
    return (SCREEN_WIDTH - 30 )/2 ;//+ 5;
}

+ (NSString *)cellId{
    return @"HomeCell";
}

- (void)setDataInfo:(GoodsModel *)imgStr{
    [self.imageButton setFrame:CGRectMake(15, 5, (SCREEN_WIDTH - 15*2), (SCREEN_WIDTH - 30 )/2-10)];
    self.imageButton.clipsToBounds = YES;
    self.labelDetail.superview.bottom = self.imageButton.bottom;
    self.labelDetail.centerY = self.labelDetail.superview.centerY;
    self.labelDetail.left = 10;
    self.labelDetail.superview.left = 15;
//    NSString *url = @"http://7xi8d6.com1.z0.glb.clouddn.com/20171113084220_LuJgqv_sakura.gun_13_11_2017_8_42_12_311.jpeg";
    //    NSURL *url = kImgUrl(imgStr.imgUrl);
    //    [self.imageButton setImageWithURL:url placeholder:kPlaceholder];
    //    if ([imgStr.imgUrl containsString:@"upload/file"]) {
    //        [self.imageButton setImageWithURL:kImgUrl(imgStr.imgUrl) placeholder:kPlaceholder];
    //    }else{
    //        [self.imageButton setImageWithURL:kImgUrlNoUpload(imgStr.imgUrl) placeholder:kPlaceholder];
    //    }
    [self.imageButton setImageWithURL:kImgNormalUrl(imgStr.advImg) placeholder:kPlaceholder];
}

#pragma mark - Setter And Getter


@end
