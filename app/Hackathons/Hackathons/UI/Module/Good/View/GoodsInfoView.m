//
//  GoodsInfoView.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "GoodsInfoView.h"

@implementation GoodsInfoView
- (void)awakeFromNib{
    [super awakeFromNib];
}
- (instancetype)init{
    
    if (self = [super init]) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GoodsInfoView" owner:self options:nil];
        self = nib.lastObject;
        
        
    }
    return self;
}
@end
