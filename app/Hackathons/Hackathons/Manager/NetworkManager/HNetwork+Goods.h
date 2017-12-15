//
//  HNetwork+Goods.h
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork.h"
@class HGoodsModel;
@interface HNetwork (Goods)
+ (NSURLSessionTask *)groupInf:(void (^)(NSInteger code, NSString *msg,id obj))success
                             failure:(void (^)(NSError *error))failure;


+ (NSURLSessionTask *)groupJoinInfo:(HGoodsModel *)model
                            success:(void (^)(NSInteger code, NSString *msg,id obj))success
                            failure:(void (^)(NSError *error))failure;

@end
