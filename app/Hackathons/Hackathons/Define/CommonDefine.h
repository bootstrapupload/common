//
//  CommonDefine.h
//  UVideo4iPad
//
//  Created by suma-zxz on 13-2-5.
//
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

// 终端软件版本
#define IPAD_APP_VERSION    @""
#define IPHONE_APP_VERSION  @""

#define FIRST_LOGIN             @"FIRST_LOGIN1"

#define REFRESHCOLLECTION    @"refreshcollection"

/*
 portal中定义的iPad或iPhone终端类型编号
 */
#define N_IPAD_FLAG 4
#define N_IPHONE_FLAG 3

#define ERROR_MESG_SUCESS @"error_mesg_sucess"
#define ERROR_MESG_UNKNOW @"error_mesg_unknow"

//IOS版本判断
#define IOS9_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )
#define IOS8_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

//iPhone5判断
#define iPhone5Screen ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//比较IOS版本，例如:if(SYSTEM_VERSION_LESS_THAN(@"6.0"))
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending) //Added by mabiao for compare iso version
#define IOS_VERSION   ([[[UIDevice currentDevice] systemVersion] floatValue])

//判断是不是iPad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) //Added by maibao

// 数据有效性检查 NSString NSDictionary NSArray NSNumber
#define TS_IS_STR_NIL(objStr) (![objStr isKindOfClass:[NSString class]] || objStr == nil || [objStr length] <= 0)
#define TS_IS_DICT_NIL(objDict) (![objDict isKindOfClass:[NSDictionary class]] || objDict == nil || [objDict count] <= 0)
#define TS_IS_ARRAY_NIL(objArray) (![objArray isKindOfClass:[NSArray class]] || objArray == nil || [objArray count] <= 0)
#define TS_IS_NUM_NIL(objNum) (![objNum isKindOfClass:[NSNumber class]] || objNum == nil)

// 判断delegate是否反应某个selector
#define TS_IS_DELEGATE_RSP_SEL(iDel, iSel) (iDel != nil && [iDel respondsToSelector:@selector(iSel)])
#define TS_IS_DELEGATE_RSP_ASEL(iDel, iSel) (iDel != nil && [iDel respondsToSelector:iSel])
#define TS_IS_DELEGATE_CFM_PROTOCOL(iDel, iProtocol) (iDel != nil && [iDel conformsToProtocol:@protocol(iProtocol)])

//国际化字符串
#undef L
#define L(str) NSLocalizedString(str, nil)

//NavBar高度
#define NavigationBar_HEIGHT 44
//StatusBar高度
#define StatusBar_HEIGHT 20
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define IS_IPHONE_6Plus ([[UIScreen mainScreen ] bounds].size.height == 736)
#define IS_IPHONE_6     ([[UIScreen mainScreen ] bounds].size.height == 667)
#define IS_IPHONE_5     ([[UIScreen mainScreen ] bounds].size.height == 568)
#define IS_IPHONE_4     ([[UIScreen mainScreen ] bounds].size.height == 480)
//文字提示显示时间
#define DURATION_NOTI_MESG 1.0
/////////
#define NORMALHEIGHT   50
#define NAVHEIGHT      30
#define kSpace 10
/////

/*字体*/
#define F0 [UIFont boldSystemFontOfSize:48/2]
#define F1 [UIFont boldSystemFontOfSize:32/2]
#define F2 [UIFont systemFontOfSize:32/2]
#define F3 [UIFont systemFontOfSize:30/2]
#define F4 [UIFont systemFontOfSize:28/2]
#define F5 [UIFont systemFontOfSize:24/2]
#define F6 [UIFont systemFontOfSize:20/2]
#define F7 [UIFont systemFontOfSize:18/2]



#define F_PF_L_14 [UIFont fontWithName:@"PingFangSC-Light" size:14]
#define F_PF_L_16 [UIFont fontWithName:@"PingFangSC-Light" size:16]
#define F_PF_L_18 [UIFont fontWithName:@"PingFangSC-Light" size:18]

#define F_PF_R_6 [UIFont fontWithName:@"PingFangSC-Regular" size:6]
#define F_PF_R_12 [UIFont fontWithName:@"PingFangSC-Regular" size:12]
#define F_PF_R_14 [UIFont fontWithName:@"PingFangSC-Regular" size:14]
#define F_PF_R_15 [UIFont fontWithName:@"PingFangSC-Regular" size:15]
#define F_PF_R_16 [UIFont fontWithName:@"PingFangSC-Regular" size:16]
#define F_PF_R_20 [UIFont fontWithName:@"PingFangSC-Regular" size:20]

//#define kImgUrl(imgUrlStr) [NSURL URLWithString:[NSString stringWithFormat:@"http://www.my5meifen.com/%@",[imgUrlStr stringByReplacingOccurrencesOfString:@"," withString:@""]]]

//#define kImgUrlNoUpload(imgUrlStr) [NSURL URLWithString:[NSString stringWithFormat:@"http://www.my5meifen.com/upload/file/%@",[imgUrlStr stringByReplacingOccurrencesOfString:@"," withString:@""]]]

#define kImgNormalUrl(imgUrlStr) [NSURL URLWithString:imgUrlStr]

#define kPlaceholder [UIImage imageNamed:@"image_placeholder"]
#define kPlaceholderHead [UIImage imageNamed:@"image_placeholder_head"]

// 通知中心
#define WNNotificationCenter [NSNotificationCenter defaultCenter]

#define DEFAULTIMAGE [[NSBundle mainBundle] pathForResource:@"ic_launcher" ofType:@"png"]

/** 应用在AppStore的 url*/
#define APPSTORE_URL @"http://itunes.apple.com/lookup?id=<Your app ID>"


// Added by XJM:
// 上传搭配的位置:是在“我的”->“穿搭”中“创建我的穿搭”，还是在“首页”的“精选”->“精选详情”／“主题”->“主题搭配列表”的“从手机相册选择”
// 这两者者区别在于:前者UINavigationController 直接返回到第一级目录
// 后者第二级目录:UINavigationController 直接返回到第一级目录

#define UploadNewDapeiFromClothingViewController 0 // 我的
#define UploadNewDapeiFromGreatestDetailViewController 1 // 精选
#define UploadNewDapeiFromTopicDetailViewController 2 // 主题

