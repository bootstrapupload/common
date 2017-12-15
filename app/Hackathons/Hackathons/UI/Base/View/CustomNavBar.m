//
//  CustomNavBar.m
//  FiveCent
//
//  Created by XuQuan on 28/06/2017.
//  Copyright © 2017 zhouxiangzhong. All rights reserved.
//

#import "CustomNavBar.h"

@interface CustomNavBar ()

@property(nonatomic, retain)UILabel *titleView;
@end

@implementation CustomNavBar


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (instancetype)init{
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = C4;
    self.layer.shadowOpacity = 0.6f;
    self.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.layer.shadowRadius = 3;// 阴影扩散的范围控制
    self.layer.shadowOffset  = CGSizeMake(1, 1);// 阴影的范围
    self.titleView.textColor = C6;
}

- (void)setTitle:(NSString *)title{
    self.titleView.text = title;
}


- (UILabel *)titleView{
    if (!_titleView) {
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.width, self.height-20)];
        _titleView.textAlignment = NSTextAlignmentCenter;
        _titleView.font = F_PF_R_16;
//        _titleView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_titleView];
    }
    return _titleView;
}

@end
