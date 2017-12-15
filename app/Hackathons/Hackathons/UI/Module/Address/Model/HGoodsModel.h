//
//  HGoodsModel.h
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGoodsModel : NSObject

@property (nonatomic, copy) NSString *provinceCode;
@property (nonatomic, copy) NSString *cityCode;
@property (nonatomic, copy) NSString *areaCode;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *senderName;

@property (nonatomic, copy) NSString *senderPhone;

@property (nonatomic, assign) NSInteger avgWeight;
@property (nonatomic, assign) NSInteger avgCount;
@property (nonatomic, assign) NSInteger groupId;
@property (nonatomic, copy) NSString * userId;


@end
