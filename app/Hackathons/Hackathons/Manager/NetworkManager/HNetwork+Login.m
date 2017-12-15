//
//  JYTNetwork+Login.m
//  health
//
//  Created by XuQuan on 25/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork+Login.h"

@implementation HNetwork (Login)



+ (NSURLSessionTask *)loginWithMobile:(NSString *)mobile
                             password:(NSString *)password
                              success:(void (^)(NSInteger code, NSString *msg,id obj))success
                              failure:(void (^)(NSError *error))failure{
    NSDictionary *param = @{
                            @"userName" : [mobile isNotBlank] ? mobile : @"",
                            @"password" : [password isNotBlank] ? password : @""
                            };
    NSURLSessionTask *task = [[HNetwork sharedManager] POST:@"/m01/f02" parameters:param success:^(NSInteger code, id responseObject) {
        success(0,[responseObject objectForKey:@"message"],responseObject);
    } failure:^(NSInteger code, NSError *error) {
        failure(error);
    }];
    return task;
}



@end
