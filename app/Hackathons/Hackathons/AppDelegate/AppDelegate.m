//
//  AppDelegate.m
//  Hackathons
//
//  Created by XuQuan on 14/12/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "AppDelegate.h"
#import "SocialSDK.h"
#import "WXApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    UINavigationBar *navBar= [UINavigationBar appearance];
//    [navBar setTintColor:C6];
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : C6}];
    [[GSPlatformParamConfigManager share] addWeChatPlatformConfigAppID:THIRDPARTY_WEIXIN_APPID];
    //初始化window
    [self initWindow];
    
    //UMeng初始化
    [self initUMeng];
    
    [self initPgyer];
    
    //初始化app服务
    [self initService];
    
    //    //初始化IM
    //    [[IMManager sharedIMManager] initIM];
    [self initBaiduMap];
    //初始化用户系统
    [self initUserManager];
    
    //网络监听
    [self monitorNetworkStatus];
    
    //广告页
    //    [AppManager appStart];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [[GSSocialManager share] handleOpenURL:url];
}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//    if ([[GSSocialManager share] handleOpenURL:url]) {
//        return YES;
//    }
//    
//    if ([url.scheme caseInsensitiveCompare:THIRDPARTY_WEIXIN_APPID] == NSOrderedSame) {
//        return [WXApi handleOpenURL:url delegate:self];
//    }
//    
//    return YES;
//}

@end
