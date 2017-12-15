//
//  AddressPage.h
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "BasePager.h"
@class HAddressModel;
@interface AddressPage : BasePager
@property (nonatomic, strong) NSArray<HAddressModel *> *records;
@end
