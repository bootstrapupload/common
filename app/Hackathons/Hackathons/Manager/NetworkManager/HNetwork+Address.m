//
//  HNetwork+Address.m
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork+Address.h"
#import "AddressPage.h"

@implementation HNetwork (Address)
+ (NSURLSessionTask *)requestPage:(NSInteger)page
                          success:(void (^)(NSInteger code, NSString *msg,id obj))success
                          failure:(void (^)(NSError *error))failure{
    NSDictionary *param = @{
                            @"page" : @(page),
                            @"size" : @(10)
                            };
    NSURLSessionTask *task = [[HNetwork sharedManager] GET:@"address/page" parameters:param success:^(NSInteger code, id responseObject) {
        if (!success) return;
        NSString *msg = [responseObject objectForKey:kMessage];
        AddressPage *model;
        
        id dataDict = [responseObject objectForKey:kData];
        model = [AddressPage modelWithDictionary:dataDict];
        
        
        success(code,msg,model);
    } failure:^(NSInteger code, NSError *error) {
        failure(error);
    }];
    
    return task;
}

+ (NSURLSessionTask *)updateAddress:(HAddressModel *)model success:(void (^)(NSInteger, NSString *, id))success failure:(void (^)(NSError *))failure{
    
    NSURLSessionTask *task = [[HNetwork sharedManager] POST:@"address/update" parameters:[model modelToJSONObject] success:^(NSInteger code, id responseObject) {
        if (!success) return;
        NSString *msg = [responseObject objectForKey:kMessage];
        success(code,msg,responseObject);
    } failure:^(NSInteger code, NSError *error) {
        failure(error);
    }];
    
    return task;
}

@end
