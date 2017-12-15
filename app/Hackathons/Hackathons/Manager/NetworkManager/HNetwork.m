//
//  HNetwork.m
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "HNetwork.h"

static NSString * kUserDefaultsFCSessionId = @"kUserDefaultsFCSessionId";



@interface HNetwork ()
@property (nonatomic, strong) NSMutableDictionary *JYTRequestHeader;
@end

@implementation HNetwork

+ (instancetype)sharedManager {
    
    static HNetwork *sharedClient = nil;
    [HNetwork closeAES];
    [HNetwork openLog];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] init];
    });
    return sharedClient;
}


//+ (void)fc_setFiveCentSessionId:(NSString *)sessionId {
//
//    if ([sessionId isNotBlank]) {
//
//        [[NSUserDefaults standardUserDefaults] setObject:sessionId forKey:kUserDefaultsFCSessionId];
//
//        NSMutableDictionary *param = [@{
//                                        @"JSESSIONID" : sessionId
//                                        } mutableCopy];
//
//        NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//        for (NSString *key in [param allKeys]) {
//            NSString *value = [param objectForKey:key];
//
//            NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithCapacity:0];
//            [properties setObject:key forKey:NSHTTPCookieName];
//            [properties setObject:value forKey:NSHTTPCookieValue];
//            [properties setObject:@".my5meifen.com" forKey:NSHTTPCookieDomain];
//            [properties setObject:@"/" forKey:NSHTTPCookiePath];
//            NSHTTPCookie *cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
//            [storage setCookie:cookie];
//        }
//    }
//}

- (NSURLSessionTask *)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSInteger, id))success failure:(void (^)(NSInteger, NSError *))failure {
    
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    [dict setValue:[parameters modelToJSONString] forKey:@"requestBody"];
//    [dict setValue:[self.JYTRequestHeader modelToJSONString] forKey:@"requestHeader"];
//
    NSURLSessionTask *task = [PPNetworkHelper POST:[self fc_fixedUrl:URLString] parameters:parameters success:^(id responseObject) {
        NSInteger status = [[responseObject objectForKey:kStatus] integerValue];
        if (status == -1) {
            [self handleNeedLogin];
            
            
            return ;
        }else if (status != 1){
            failure(-401,[NSError errorWithDomain:[responseObject objectForKey:@"message"] code:-401 userInfo:nil]);
            return;
        }
        
        if (!success) return;
        
        success(1, responseObject);
    } failure:^(NSError *error) {
        if (!failure) return;
        
        failure(-400, error);
    }];
    
    return task;
}

- (NSURLSessionTask *)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSInteger, id))success failure:(void (^)(NSInteger, NSError *))failure {
    
    
    NSURLSessionTask* task = [PPNetworkHelper GET:[self fc_fixedUrl:URLString] parameters:parameters success:^(id responseObject) {
        NSInteger code = [[responseObject objectForKey:kStatus] integerValue];
        if (code == -1) {
            [self handleNeedLogin];
        }
        
        if (!success) return;
        
        success(code, responseObject);
    } failure:^(NSError *error) {
        if (!failure) return;
        
        failure(-400, error);
    }];
    
    return task;
}

- (void)uploadImageWithURL:(NSString *)URL
                    header:(id)headers
                      body:(id)body
                   success:(void (^)(NSInteger, id))success
                   failure:(void (^)(NSInteger, NSError *))failure {
    
    
    [PPNetworkHelper uploadImageWithURL:[self fc_fixedUrl:URL] header:headers body:body parameters:nil success:^(id responseObject) {
        
        
        if (!success) {
            return ;
        }
        success(0,responseObject);
    } failure:^(NSError *error) {
        if (!failure) {
            return ;
        }
        failure(-400, error);
    }];
}

#pragma mark - fix url
- (NSString *)fc_fixedUrl:(NSString *)originUrl {
    
    NSString *requestUrlString = nil;
    if ([[originUrl lowercaseString] hasPrefix:@"http"]) {
        requestUrlString = originUrl;
    } else {
        //                NSString *host = @"http://10.118.45.70:8080/jiuetongApi/";
        NSString *host = URL_main;
        if ([originUrl isEqualToString:@"/upload"]) {
            host = URL_upload;
        }
        
        requestUrlString = [host stringByAppendingPathComponent:originUrl];
    }
    
    return [requestUrlString copy];
}

- (void)handleNeedLogin {
    [MBProgressHUD showErrorMessage:@"未登录或登录信息过期，该操作需要登录后才可使用"];
    [userManager logout:nil];
}

- (NSMutableDictionary *)JYTRequestHeader{
    if (!_JYTRequestHeader) {
        _JYTRequestHeader = [NSMutableDictionary new];
    }
    if (userManager.token) {
        [_JYTRequestHeader setObject:userManager.token forKey:@"token"];
    }
    return _JYTRequestHeader;
}

@end
