//
//  CreateAddressViewController.h
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "RootViewController.h"
#import "GoodsModel.h"
@interface CreateAddressViewController : RootViewController
@property (nonatomic
           ,assign) NSInteger groupId;
@property (nonatomic, strong) GoodsModel *goodsModel;
@end
