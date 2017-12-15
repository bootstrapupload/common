//
//  UIUtil.h
//  yushangbao
//
//  Created by ChenXuquan on 15/8/18.
//  Copyright (c) 2015年 ChenXuquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIUtil : NSObject<UIScrollViewDelegate>

+ (void)setSeparatorWithTableView:(UITableView *)tableView;
+ (void)setSeparatorWithTableViewCell:(UITableViewCell *)cell;

+ (UIImage *)createImageWithColor:(UIColor *)color;

+ (UIBarButtonItem *)creatRightItemWithImage:(UIImage *)image withBlock:(void (^)())block;
+ (UIBarButtonItem *)createItemWithText:(NSString *)text;
+ (UIBarButtonItem *)creatLeftItemWithText:(NSString *)text withBlock:(void (^)())block;
+ (UIBarButtonItem *)creatRightItemWithSolidText:(NSString *)text withBlock:(void (^)())block;
+ (UIBarButtonItem *)creatRightItemWithText:(NSString *)text withBlock:(void (^)())block;
+ (UIBarButtonItem *)creatRightItemWithTextByXJM:(NSString *)text withFont:(UIFont*)font withBlock:(void (^)())block;

+ (CGSize)getSizeOfString:(NSString *)string withFont:(UIFont *)font;

+ (NSString *) image2DataURL: (UIImage *) image;

+ (NSDictionary*)parseFromURL:(NSString*)strurl;

+ (float)getHeighFromString:(NSString *)string fontSize:(float)fontSize width:(float)width;
+ (float)getWidthFromString:(NSString *)string fontSize:(float)fontSize height:(float)height;
+ (float)getWidthFromString:(NSString *)string BoldfontSize:(float)fontSize height:(float)height;
/**
 *  添加行间距
 *
 *  @param num    <#num description#>
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
+ (NSMutableAttributedString *)lineSpacingString:(CGFloat)num AndString:(NSString *)string;
+ (NSMutableAttributedString *)lineSpacingString:(CGFloat)num AndMutableString:(NSMutableAttributedString *)string;
/**
 *  添加行间距后label高度
 *
 *  @param string <#string description#>
 *  @param font   <#font description#>
 *  @param num    <#num description#>
 *  @param width  <#width description#>
 *
 *  @return <#return value description#>
 */
+ (CGFloat)calculateLabelHeightWithString:(NSString *)string AndFont:(UIFont *)font AndSpaceNum:(CGFloat)num AndLabelWidth:(CGFloat)width;

+ (UIView *)getNoSignHintToEdit:(NSString *)content withBlock:(void(^)())blocktoEdit;


/** 计算文字Size */
+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;

+ (UIImage *) screenShotAction:(UIView *)view;
+ (UIImage *)translateBlurredSnapshot:(UIView *)view;

+ (NSMutableAttributedString *)createStrWithPhoneNumAllStr:(NSString *)string AndPhoneNumColor:(UIColor *)color;
+ (NSMutableAttributedString *)createStrWithWebPageAllStr:(NSString *)string AndWebPageColor:(UIColor *)color;
+ (NSMutableAttributedString *)createStrWithPhoneNUmAndWebPageAllStr:(NSString *)string AndPhoneNumcolor:(UIColor *)phoneColor AndWebPageColor:(UIColor *)webPageColor;

+ (NSMutableAttributedString *)changePriceIntegerbit:(NSString *)str andFont:(UIFont *)font andColor:(UIColor *)color;


+ (UIImage*) BgImageFromColors:(NSArray*)colors withFrame: (CGRect)frame;

+ (UIImage *)blurredSnapshot:(UIView *)view;///毛玻璃效果


+ (UIColor *)HexColorWithStr:(NSString *)strcolor;
+ (NSString*)getStringbyDate:(NSDate*)date;


+ (NSString*)getTimeString_YMD_byDate:(NSDate *)date;
@end
