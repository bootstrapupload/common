//
//  DataUtil.h
//  xqzg
//
//  Created by 维农 on 15/12/30.
//  Copyright © 2015年 维农-quan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REGULAREXPRESSION_OPTION(regularExpression,regex,option) \
\
static inline NSRegularExpression * k##regularExpression() { \
static NSRegularExpression *_##regularExpression = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_##regularExpression = [[NSRegularExpression alloc] initWithPattern:(regex) options:(option) error:nil];\
});\
\
return _##regularExpression;\
}\


#define REGULAREXPRESSION(regularExpression,regex) REGULAREXPRESSION_OPTION(regularExpression,regex,NSRegularExpressionCaseInsensitive)

REGULAREXPRESSION(PhoneNumRegularExpression, @"\\d{3}-\\d{8}|\\d{3} \\d{8}|\\d{3}-\\d{7}|\\d{3} \\d{7}|\\d{4}-\\d{8}|\\d{4} \\d{8}|\\d{4}-\\d{7}|1+[3456789]+\\d{9}|\\d{3} \\d{4} \\d{4}|\\d{3}-\\d{4}-\\d{4}")
REGULAREXPRESSION(Punctuation, @"\\p{P}|\\p{C}|\\p{M}|\\p{S}")//符号
REGULAREXPRESSION(URLExpression, @"[a-zA-z]+://[^\\s]*");
REGULAREXPRESSION(WithdrawTime, @"\\d*-\\d*")//提现时间

@interface DataUtil : NSObject

+ (BOOL)isMainstr:(NSString*)mainstr containSubstr:(NSString*)substr;
+ (BOOL) isBlankString:(NSString *)string;
+ (NSString *)generateImageName;
+ (NSString*)getBirthString_YMDHMS_byDate:(NSDate *)date;
+ (NSString*)getString_YMDHMS_byDate:(NSDate *)date;
+ (NSString*)getString_YMDHM_byDate:(NSDate *)date;
/** 时间戳转成日期字符串 默认 yyyy-MM-dd hh:mm:ss */
+ (NSString*)getString_YMDHMS_byTimeStamp:(long)timeStamp;
+ (NSString*)getTimeString_YMD_byDate:(NSDate *)date;
+ (NSString*)getStringbyDate:(NSDate*)date;
+ (NSString*)getwnStringbyDate:(NSDate*)date;
+ (long)stringDFromDate:(NSString *)dateString;
+ (BOOL)isPhoneNum:(NSString *)phoneStr;

/** 时间字符串转NSDate对象 */
+ (NSDate *)dateWithString:(NSString *)dateString andFormatString:(NSString *)formatStr;

+ (BOOL) isLaterDate:(NSDate *)time1 :(NSDate *)time2;

/**
 *  判定手机号正则
 */
+ (NSArray *)analyzePhoneNumber:(NSString *)string;
/**
 *  判定网址正则
 */
+ (NSArray *)analyzeURL:(NSString *)string;

+ (NSArray *)analyzeWithExpression:(NSRegularExpression *)regexp andString:(NSString *)string;


@end
