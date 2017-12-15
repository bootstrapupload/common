//
//  AddressPage.m
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "AddressPage.h"
#import "HAddressModel.h"
@implementation AddressPage
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"records" : [HAddressModel class]};
}

@end
