//
//  HNetwork.h
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "PPNetworkHelper.h"
static const NSString * kStatus = @"result";
static const NSString * kMessage = @"msg";
static const NSString * kData = @"data";

static NSString * kSUCCESS = @"SUCCESS";
static NSString * kERROR = @"ERROR";
static NSString * kLogin = @"LOGIN";

@interface HNetwork : PPNetworkHelper
/**
 *  获取当前client client 为单例
 *
 *  @return NTESHTClient
 */
+ (instancetype)sharedManager;


- (NSURLSessionTask *)POST:(NSString *)URLString
                parameters:(id)parameters
                   success:(void (^)(NSInteger, id))success
                   failure:(void (^)(NSInteger, NSError *))failure;


- (NSURLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(NSInteger, id))success
                  failure:(void (^)(NSInteger, NSError *))failure;


- (void)uploadImageWithURL:(NSString *)URL
                    header:(id)headers
                      body:(id)body
                   success:(void (^)(NSInteger, id))success
                   failure:(void (^)(NSInteger, NSError *))failure;
@end
