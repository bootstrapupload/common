//
//  HNetwork+Goods.m
//  Hackathons
//
//  Created by XuQuan on 15/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork+Goods.h"
#import "HGoodsModel.h"
#import "GoodsModel.h"
@implementation HNetwork (Goods)
+ (NSURLSessionTask *)groupInf:(void (^)(NSInteger code, NSString *msg,id obj))success
                       failure:(void (^)(NSError *error))failure{
    NSURLSessionTask *task = [[HNetwork sharedManager] GET:NSStringFormat(@"groupInf/list") parameters:@{} success:^(NSInteger code, id responseObject) {
        if (!success) return;
        NSString *msg = [responseObject objectForKey:kMessage];
        NSArray *arr = [NSArray modelArrayWithClass:[GoodsModel class] json:[responseObject objectForKey:kData]];
        
        success(code,msg,arr);
    } failure:^(NSInteger code, NSError *error) {
        failure(error);
    }];
    
    return task;
}


+ (NSURLSessionTask *)groupJoinInfo:(HGoodsModel *)model
                            success:(void (^)(NSInteger code, NSString *msg,id obj))success
                            failure:(void (^)(NSError *error))failure{
    NSURLSessionTask *task = [[HNetwork sharedManager] POST:NSStringFormat(@"groupJoinInfo/new") parameters:[model modelToJSONData] success:^(NSInteger code, id responseObject) {
        if (!success) return;
        NSString *msg = [responseObject objectForKey:kMessage];
        success(code,msg,responseObject);
    } failure:^(NSInteger code, NSError *error) {
        failure(error);
    }];
    
    return task;
}

@end
