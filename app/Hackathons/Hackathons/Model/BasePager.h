//
//  BasePager.h
//  health
//
//  Created by XuQuan on 28/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasePager : NSObject
@property (nonatomic, copy) NSString *orderByField;

@property (nonatomic, assign) NSInteger pages;

@property (nonatomic, assign) NSInteger current;

@property (nonatomic, copy) NSString *condition;

@property (nonatomic, assign) BOOL asc;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger offset;

@property (nonatomic, assign) NSInteger limit;

@property (nonatomic, assign) BOOL openSort;

@property (nonatomic, assign) BOOL searchCount;

@property (nonatomic, assign) NSInteger offsetCurrent;
@end
