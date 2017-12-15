//
//  BaseTableViewCell.h
//  yushangbao
//
//  Created by ChenXuquan on 15/8/14.
//  Copyright (c) 2015年 ChenXuquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (NSString *) cellId;
+ (CGFloat)heightInRow:(NSInteger)row inWidth:(CGFloat)width;
+ (CGFloat)height;

- (void)setDataInfo:(id)obj;
@end
