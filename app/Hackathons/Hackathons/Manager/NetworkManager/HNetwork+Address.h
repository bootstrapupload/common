//
//  HNetwork+Address.h
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork.h"
#import "HAddressModel.h"

@interface HNetwork (Address)
+ (NSURLSessionTask *)requestPage:(NSInteger)page
                          success:(void (^)(NSInteger code, NSString *msg,id obj))success
                          failure:(void (^)(NSError *error))failure;

+ (NSURLSessionTask *)insertAddress:(HAddressModel *)model
                            success:(void (^)(NSInteger code, NSString *msg,id obj))success
                            failure:(void (^)(NSError *error))failure;


+ (NSURLSessionTask *)updateAddress:(HAddressModel *)model
                          success:(void (^)(NSInteger code, NSString *msg,id obj))success
                          failure:(void (^)(NSError *error))failure;


+ (NSURLSessionTask *)getProviceList:(void (^)(NSInteger code, NSString *msg,id obj))success
                             failure:(void (^)(NSError *error))failure;

+ (NSURLSessionTask *)getCityList:(NSString *)provinceCode
                          success:(void (^)(NSInteger code, NSString *msg,id obj))success
                            failure:(void (^)(NSError *error))failure;

+ (NSURLSessionTask *)getAreaList:(NSString *)cityCode
                          success:(void (^)(NSInteger code, NSString *msg,id obj))success
                          failure:(void (^)(NSError *error))failure;


@end

