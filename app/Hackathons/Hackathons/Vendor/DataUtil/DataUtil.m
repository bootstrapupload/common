//
//  DataUtil.m
//  xqzg
//
//  Created by 维农 on 15/12/30.
//  Copyright © 2015年 维农-quan. All rights reserved.
//

#import "DataUtil.h"





@implementation DataUtil
+ (BOOL)isMainstr:(NSString*)mainstr
    containSubstr:(NSString*)substr{
    NSRange range = [mainstr rangeOfString:substr];
    if (range.location == NSNotFound) {
        return NO;
    }
    return YES;
}
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if (((NSNull *)string) == [NSNull null]) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+(NSString *)generateImageName
{
    int count = 20;
    char data[count];
//
//    for (int x=0;x<count;data[x++] = (char)('a' + (arc4random_uniform(26))));
//    
    for (int i=0; i<count; i++) {
        int ram = arc4random_uniform(26+10);
        if (ram<10) {
            data[i] = (char)('0' + (arc4random_uniform(10)));
        }else{
            data[i] = (char)('a' + (arc4random_uniform(26)));
        }
    }
    
    NSString*name = [[NSString alloc] initWithBytes:data length:20 encoding:NSUTF8StringEncoding];
    return [[NSString alloc] initWithFormat:@"%@.jpg",name];
}

#pragma mark - 时间：消息列表
+ (NSString*)getwnStringbyDate:(NSDate*)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday =  [cal dateByAddingComponents:components toDate: today options:0];
    
    [components setHour:-24 * 7];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *weekago = [cal dateByAddingComponents:components toDate:today options:0];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    if (date == [date earlierDate:weekago]) {
        // 昨天以前－其他时间
        [format setDateFormat:@"MM月dd日"];
    }else if(date== [date earlierDate:yesterday]){
        [format setDateFormat:@"EEEE"];
    }else if(date == [date earlierDate:today]){
        // 昨天以后～今天以前 － 昨天
        [format setDateFormat:@"昨天 HH:mm"];
    }else{
        [format setDateFormat:@"HH:mm"];
    }
    
    return [format stringFromDate:date];
}

#pragma mark - 时间：帖子


+ (NSString*)getStringbyDate:(NSDate*)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday =  [cal dateByAddingComponents:components toDate: today options:0];
    
    [components setYear:-1];
    NSDate *lastyear = [cal dateByAddingComponents:components toDate: today options:0];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    if (date == [date earlierDate:lastyear]) {
        [format setDateFormat:@"yy-MM-dd HH:mm"];
    }else if (date == [date earlierDate:yesterday]) {
        // 昨天以前－其他时间
        [format setDateFormat:@"MM-dd HH:mm"];
    }else if(date == [date earlierDate:today]){
        // 昨天以后～今天以前 － 昨天
        [format setDateFormat:@"昨天 HH:mm"];
    }else{
        // 今天
        NSDate *now = [NSDate new];
        NSTimeInterval timelong = -[date timeIntervalSinceDate:now];
        if (timelong < 300) {
            return @"刚刚";
        }else if(timelong < 3600)
        {
            int n = timelong/60;
            return [NSString stringWithFormat:@"%d分钟前",n];
        }else{
            int n = timelong/3600;
            return [NSString stringWithFormat:@"%d小时前",n];
        }
        
    }
    
    return [format stringFromDate:date];
}

+ (BOOL) isLaterDate:(NSDate *)time1 :(NSDate *)time2 {
    NSDate *late = [time1 earlierDate:time2];
    
    if ([late isEqualToDate:time1]) {
        return YES;
    }
    return NO;
}


#pragma mark - 时间: yyyy-mm-dd HH:mm:ss
+ (NSString*)getString_YMDHMS_byDate:(NSDate *)date{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [format stringFromDate:date];
}

+ (NSString*)getString_YMDHM_byDate:(NSDate *)date{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [format stringFromDate:date];
}

/** 时间戳转成日期字符串 默认 yyyy-MM-dd hh:mm:ss */
+ (NSString*)getString_YMDHMS_byTimeStamp:(long)timeStamp {
    NSDate *createTimeDate = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [self getString_YMDHMS_byDate:createTimeDate];
}
/*!
 *  生日的
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
+ (NSString*)getBirthString_YMDHMS_byDate:(NSDate *)date{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy年MM月dd日"];
    return [format stringFromDate:date];
}

+ (NSString*)getTimeString_YMD_byDate:(NSDate *)date{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    return [format stringFromDate:date];
}

+ (long)stringDFromDate:(NSString *)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate* date = [dateFormatter dateFromString:dateString];
    return [date timeIntervalSince1970];
//    NSString *destDateString = [dateFormatter stringFromDate:date];
//    
//    return destDateString;
    
}

+ (NSDate *)dateWithString:(NSString *)dateString andFormatString:(NSString *)formatStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (formatStr == nil) {
        formatStr = @"yyyy-MM-dd";
    }
    [dateFormatter setDateFormat:formatStr];
    return [dateFormatter dateFromString:dateString];
}

+ (BOOL)isPhoneNum:(NSString *)phoneStr{
    NSRegularExpression *const regexp = kPhoneNumRegularExpression();
    return [regexp numberOfMatchesInString:phoneStr options:0 range:NSMakeRange(0, [phoneStr length])];
}

+ (NSArray *)analyzePhoneNumber:(NSString *)string{
    NSRegularExpression * const regexp = kPhoneNumRegularExpression();
    return [DataUtil analyzeWithExpression:regexp andString:string];
}

+ (NSArray *)analyzeURL:(NSString *)string{
    NSRegularExpression * const regexp = kURLExpression();
    return [DataUtil analyzeWithExpression:regexp andString:string];
}


+ (NSArray *)analyzeWithExpression:(NSRegularExpression *)regexp andString:(NSString *)string{
    NSMutableArray *resArray = [[NSMutableArray alloc] init];
    NSRange stringRange;
    stringRange = NSMakeRange(0, [string length]);
    NSArray<NSTextCheckingResult *> *curresults = [regexp matchesInString:string options:0 range:stringRange];
    for (NSTextCheckingResult *result in curresults) {
        NSRange foundRange = result.range;
        NSValue *value = [NSValue valueWithRange:foundRange];
        [resArray addObject:value];
    }
    if (resArray.count) {
        return [NSArray arrayWithArray:resArray];
    }else{
        return nil;
    }
}

@end
