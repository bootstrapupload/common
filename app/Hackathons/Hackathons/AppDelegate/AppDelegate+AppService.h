//
//  AppDelegate+AppService.h
//  health
//
//  Created by XuQuan on 22/09/2017.
//  Copyright © 2017 XuQuan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
//初始化服务
-(void)initService;

//初始化 window
-(void)initWindow;

//初始化 UMeng
-(void)initUMeng;

///初始化蒲公英
- (void)initPgyer;

-(void)initBaiduMap;

//初始化用户系统
-(void)initUserManager;

//监听网络状态
- (void)monitorNetworkStatus;


//单例
+ (AppDelegate *)shareAppDelegate;

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;
@end
