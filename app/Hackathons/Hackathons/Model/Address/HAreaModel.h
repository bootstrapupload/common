//
//  HAreaModel.h
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HAreaModel : NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *cityCode;
@property (nonatomic, copy) NSString *provinceCode;

@end
