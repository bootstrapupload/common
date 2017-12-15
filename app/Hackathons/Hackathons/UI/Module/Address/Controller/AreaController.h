//
//  AreaController.h
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "RootViewController.h"
@class HAreaModel;
@interface AreaController : RootViewController
@property (nonatomic, assign) int type;

@property (nonatomic, strong) HAreaModel *pCode;
@property (nonatomic, strong) HAreaModel *cCode;

@property (nonatomic, copy) void(^EditBlock)(HAreaModel *pM,HAreaModel *cM,HAreaModel *aM);
@end
