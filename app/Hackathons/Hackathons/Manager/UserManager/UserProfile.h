//
//  UserProfile.h
//  health
//
//  Created by XuQuan on 28/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserProfile : NSObject

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, copy) NSString *headImage;

@property (nonatomic, copy) NSString *passwd;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, copy) NSString *updateTime;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, assign) NSInteger userStatus;

@property (nonatomic, copy) NSString *telephone;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *nickName;

@end
