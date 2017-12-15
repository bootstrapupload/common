//
//  HAddressModel.h
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HAddressModel : NSObject
@property (nonatomic, copy) NSString *parentCode;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *updateAt;
@end
