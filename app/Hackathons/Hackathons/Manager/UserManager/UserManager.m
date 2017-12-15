//
//  UserManager.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/22.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "UserManager.h"
//#import <UMSocialCore/UMSocialCore.h>
#import "HNetwork+Login.h"


@implementation UserManager

SINGLETON_FOR_CLASS(UserManager);

-(instancetype)init{
    self = [super init];
    if (self) {
        //被踢下线
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKick)
                                                     name:KNotificationOnKick
                                                   object:nil];
    }
    return self;
}

#pragma mark ————— 三方登录 —————
-(void)login:(UserLoginType )loginType completion:(loginBlock)completion{
    [self login:loginType params:nil completion:completion];
}

#pragma mark ————— 带参数登录 —————
-(void)login:(UserLoginType )loginType params:(NSDictionary *)params completion:(loginBlock)completion{
    if (loginType == kUserLoginTypePwd) {
        [self loginToServer:params completion:completion];
    }
    
}

#pragma mark ————— 手动登录到服务器 —————
-(void)loginToServer:(NSDictionary *)params completion:(loginBlock)completion{
    [MBProgressHUD showActivityMessageInView:@"登录中..."];
    
    [HNetwork loginWithMobile:params[@"username"] password:params[@"password"] success:^(NSInteger code, NSString *msg, id responseObject) {
        [self LoginSuccess:responseObject completion:completion];
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        if (completion) {
            completion(NO,error.domain);
        }
    }];

}

#pragma mark ————— 自动登录到服务器 —————
-(void)autoLoginToServer:(loginBlock)completion{
    
}

#pragma mark ————— 登录成功处理 —————
-(void)LoginSuccess:(id )responseObject completion:(loginBlock)completion{
    [MBProgressHUD hideHUD];
    if (ValidDict(responseObject)) {
        if (ValidDict(responseObject[@"data"])) {
            NSDictionary *data = responseObject[@"data"];
            self.curUserInfo = [UserInfo modelWithDictionary:data];
            [self saveUserInfo];
            self.isLogined = YES;
            self.token = self.curUserInfo.token;
            if (completion) {
                completion(YES,nil);
            }
        }
    }else{
        if (completion) {
            completion(NO,@"登录返回数据异常");
        }
        KPostNotification(KNotificationLoginStateChange, @NO);
    }
    
}
#pragma mark ————— 储存用户信息 —————
-(void)saveUserInfo{
    if (self.curUserInfo) {
        YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
        NSDictionary *dic = [self.curUserInfo modelToJSONObject];
        [cache setObject:dic forKey:KUserModelCache];
    }
    
}
#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    NSDictionary * userDic = (NSDictionary *)[cache objectForKey:KUserModelCache];
    if (userDic) {
        self.curUserInfo = [UserInfo modelWithJSON:userDic];
        return YES;
    }
    return NO;
}

- (NSString *)token{
    return self.curUserInfo.token;
}

#pragma mark ————— 被踢下线 —————
-(void)onKick{
    [self logout:nil];
}
#pragma mark ————— 退出登录 —————
- (void)logout:(void (^)(BOOL, NSString *))completion{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationLogout object:nil];//被踢下线通知用户退出直播间
    
//    [[IMManager sharedIMManager] IMLogout];
    
    self.curUserInfo = nil;
    self.isLogined = NO;

//    //移除缓存
    YYCache *cache = [[YYCache alloc]initWithName:KUserCacheName];
    [cache removeAllObjectsWithBlock:^{
        if (completion) {
            completion(YES,nil);
        }
    }];
    
    KPostNotification(KNotificationLoginStateChange, @NO);
}
@end
