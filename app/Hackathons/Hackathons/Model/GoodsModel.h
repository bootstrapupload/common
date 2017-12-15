//
//  GoodsModel.h
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger dailyMinPackage;

@property (nonatomic, assign) NSInteger weightMin;

@property (nonatomic, assign) NSInteger groupType;

@property (nonatomic, assign) NSInteger proMarketBaseId;

@property (nonatomic, assign) NSInteger groupLimit;

@property (nonatomic, assign) NSInteger groupDuration;

@property (nonatomic, copy) NSString *advImg;

@property (nonatomic, copy) NSString *groupEndTime;

@property (nonatomic, copy) NSString *groupFinishTime;

@property (nonatomic, assign) NSInteger weightMax;

@property (nonatomic, assign) NSInteger basePrice;

@property (nonatomic, assign) NSInteger groupCount;

@property (nonatomic, assign) NSInteger baseWeight;

@property (nonatomic, copy) NSString *groupName;

@property (nonatomic, copy) NSString *groupRule;

@property (nonatomic, assign) NSInteger groupState;
@end
