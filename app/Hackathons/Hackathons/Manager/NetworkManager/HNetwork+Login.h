//
//  JYTNetwork+Login.h
//  health
//
//  Created by XuQuan on 25/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork.h"

@interface HNetwork (Login)

+ (NSURLSessionTask *)loginWithMobile:(NSString *)mobile
                             password:(NSString *)password
                              success:(void (^)(NSInteger code, NSString *msg,id obj))success
                              failure:(void (^)(NSError *error))failure;



@end
