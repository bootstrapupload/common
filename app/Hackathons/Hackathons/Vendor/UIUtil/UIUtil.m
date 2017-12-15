//
//  UIUtil.m
//  yushangbao
//
//  Created by ChenXuquan on 15/8/18.
//  Copyright (c) 2015年 ChenXuquan. All rights reserved.
//

#import "UIUtil.h"
#import "DataUtil.h"


@implementation UIUtil
/// round point value for pixel-aligned

+ (void)setSeparatorWithTableView:(UITableView *)tableView{
    if (IOS_VERSION >= 7.0) {
        
        if (IOS_VERSION < 8.0) {
            
            [tableView setSeparatorInset:UIEdgeInsetsZero];
            
        }else{
            if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
                [tableView setSeparatorInset:UIEdgeInsetsZero];
            }
            
            if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
                [tableView setLayoutMargins:UIEdgeInsetsZero];
            }
        }
    }
}

+ (void)setSeparatorWithTableViewCell:(UITableViewCell *)cell{
    if (IOS_VERSION >= 8.0) {
        
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}

/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+(UIBarButtonItem *)creatRightItemWithImage:(UIImage *)image withBlock:(void (^)())block{
    UIButton * b = [[UIButton alloc] init];
    b.frame = CGRectMake(0, 0, 44, 44);
    //    b.imageEdgeInsets = RigthItemEdge;
    b.contentMode = UIViewContentModeScaleAspectFit;
    [b setImage:image forState:UIControlStateNormal];
    
    [b bk_addEventHandler:^(id sender) {
        block();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    return rightItem;
}
+ (UIBarButtonItem *)createItemWithText:(NSString *)text{
    UILabel * b = [[UILabel alloc] init];
    b.frame = CGRectMake(0, 0, 60, 30);
    [b setText:text];
    b.textColor = [UIColor whiteColor];
    //    [b.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    b.font = F1;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    return rightItem;
    
}

+ (UIBarButtonItem *)creatRightItemWithSolidText:(NSString *)text withBlock:(void (^)())block{
    UIButton * b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(0, 0, 60, 30);
    [b.titleLabel setTextAlignment:NSTextAlignmentRight];
    //    [b.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    b.titleLabel.font = F2;
    b.titleLabel.adjustsFontSizeToFitWidth = YES;
//    [b setRadius:4 borderWidth:0 borderColor:C6];
    [b setTitleColor:C4 forState:UIControlStateNormal];
    [b setTitleColor:C3 forState:UIControlStateDisabled];
    [b setTitle:text forState:UIControlStateNormal];
    [b setBackgroundImage:[UIImage imageWithColor:C6] forState:UIControlStateNormal];
    [b bk_addEventHandler:^(id sender) {
        block();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    return rightItem;
    
}

+ (UIBarButtonItem *)creatRightItemWithText:(NSString *)text withBlock:(void (^)())block{
    UIButton * b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(0, 0, 60, 30);
    b.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [b.titleLabel setTextAlignment:NSTextAlignmentRight];
    //    [b.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    b.titleLabel.font = F2;
    b.titleLabel.adjustsFontSizeToFitWidth = YES;
    [b setTitleColor:C11 forState:UIControlStateNormal];
    [b setTitleColor:C3 forState:UIControlStateDisabled];
    [b setTitle:text forState:UIControlStateNormal];
    
    [b bk_addEventHandler:^(id sender) {
        block();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    return rightItem;
    
}


+ (UIBarButtonItem *)creatLeftItemWithText:(NSString *)text withBlock:(void (^)())block{
    UIButton * b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(0, 0, 60, 30);
    b.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [b.titleLabel setTextAlignment:NSTextAlignmentRight];
    //    [b.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    b.titleLabel.font = F2;
    b.titleLabel.adjustsFontSizeToFitWidth = YES;
    [b setTitleColor:C11 forState:UIControlStateNormal];
    [b setTitleColor:C3 forState:UIControlStateDisabled];
    [b setTitle:text forState:UIControlStateNormal];
    
    [b bk_addEventHandler:^(id sender) {
        block();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    return rightItem;
    
}
/*
 * XJM:for 搭配详情页右边的“..."
 */
+ (UIBarButtonItem *)creatRightItemWithTextByXJM:(NSString *)text withFont:(UIFont*)font withBlock:(void (^)())block{
    UIButton * b = [UIButton buttonWithType:UIButtonTypeCustom];
    b.frame = CGRectMake(0, 0, 60, 40);
    b.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    b.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [b.titleLabel setTextAlignment:NSTextAlignmentRight];
    //    [b.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    b.titleLabel.font = font;
    b.titleLabel.adjustsFontSizeToFitWidth = YES;
    [b setTitleColor:C11 forState:UIControlStateNormal];
    [b setTitleColor:C3 forState:UIControlStateDisabled];
    [b setTitle:text forState:UIControlStateNormal];
    
    [b bk_addEventHandler:^(id sender) {
        block();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc]initWithCustomView:b];
    return rightItem;
    
}

+ (CGSize)getSizeOfString:(NSString *)string withFont:(UIFont *)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size];
}


+ (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}
+ (NSString *) image2DataURL: (UIImage *) image
{
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        mimeType = @"image/jpeg";
    }
    
    return [NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
            [imageData base64EncodedStringWithOptions: 0]];
    
}
+ (NSDictionary*)parseFromURL:(NSString*)strurl{
    
    NSMutableDictionary* mdic  = [NSMutableDictionary new];
    NSURL* url = [NSURL URLWithString:strurl];
    
    NSLog(@"Scheme: %@", [url scheme]);
    NSLog(@"Host: %@", [url host]);
    NSLog(@"Port: %@", [url port]);
    NSLog(@"Path: %@", [url path]);
    NSLog(@"Relative path: %@", [url relativePath]);
    NSLog(@"Path components as array: %@", [url pathComponents]);
    NSLog(@"Parameter string: %@", [url parameterString]);
    NSLog(@"Query: %@", [url query]);
    NSLog(@"Fragment: %@", [url fragment]);
    
    
    NSString* path = [url path];
    if ([path hasPrefix:@"/"]) {
        path = [path substringFromIndex:1];
    }
    NSArray* patharray = [path componentsSeparatedByString:@"/"];
    [mdic setValue:[url scheme] forKey:@"scheme"];
    [mdic setValue:[url host]   forKey:@"host"];
    [mdic setValue:patharray   forKey:@"path"];
    
    
    NSArray* array = [strurl componentsSeparatedByString:@"?"];
    if (array.count > 1) {
        NSString* params = array[1];
        NSArray* paramarray = [params componentsSeparatedByString:@"&"];
        for (NSString* kvstr in paramarray) {
            NSArray* kvarray = [kvstr componentsSeparatedByString:@"="];
            if (kvarray.count > 1) {
                NSString* key = kvarray[0];
                NSString* value = kvarray[1];
                [mdic setValue:value forKey:key];
            }
        }
    }
    
    
    
    return mdic;
}


+ (float)getHeighFromString:(NSString *)string fontSize:(float)fontSize width:(float)width
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    CGFloat height = rect.size.height+10;
    return height;
}

+ (float)getWidthFromString:(NSString *)string fontSize:(float)fontSize height:(float)height{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    CGFloat width = rect.size.width + 5;
    return width;
}

+ (float)getWidthFromString:(NSString *)string BoldfontSize:(float)fontSize height:(float)height{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:fontSize]} context:nil];
    CGFloat width = rect.size.width + 5;
    return width;
}

+(NSMutableAttributedString *)lineSpacingString:(CGFloat)num AndString:(NSString *)string{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:num];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return attributedString;
}

+ (NSMutableAttributedString *)lineSpacingString:(CGFloat)num AndMutableString:(NSMutableAttributedString *)string{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:num];//调整行间距
    
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return string;
}

+ (CGFloat)calculateLabelHeightWithString:(NSString *)string AndFont:(UIFont *)font AndSpaceNum:(CGFloat)num AndLabelWidth:(CGFloat)width{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:num];
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    
    return rect.size.height;
}

+ (UIImage*) BgImageFromColors:(NSArray*)colors withFrame: (CGRect)frame

{
    
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        
        [ar addObject:(id)c.CGColor];
        
    }
    
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGPoint start;
    
    CGPoint end;
    
    
    
    start = CGPointMake(0.0, frame.size.height);
    
    end = CGPointMake(frame.size.width, 0.0);
    
    
    
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(colorSpace);
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIImage *)blurredSnapshot:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(view.frame), CGRectGetHeight(view.frame)), NO, 1.0f);
    [view drawViewHierarchyInRect:CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame)) afterScreenUpdates:NO];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Now apply the blur effect using Apple's UIImageEffect category
    UIImage *blurredSnapshotImage = [snapshotImage imageByTintColor:[UIColor colorWithWhite:0.1 alpha:0.5]];
    // Or apply any other effects available in "UIImage+ImageEffects.h"
    // UIImage *blurredSnapshotImage = [snapshotImage applyDarkEffect];
    // UIImage *blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
    
    UIGraphicsEndImageContext();
    
    return blurredSnapshotImage;
}

+ (UIImage *) screenShotAction:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)translateBlurredSnapshot:(UIView *)view{
    UIImage *bg = [self screenShotAction:view];
    
    return [bg imageByBlurRadius:5 tintColor:[UIColor colorWithWhite:1.0 alpha:0.3] tintMode:kCGBlendModeNormal saturation:1.8 maskImage:nil];
}

+ (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize; {
    CGRect rect = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}


+ (NSMutableAttributedString *)createStrWithPhoneNumAllStr:(NSString *)string AndPhoneNumColor:(UIColor *)color{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    //    NSString *str = [NSString stringWithFormat:@"%@",string];
    
    NSArray *curresults = [DataUtil analyzePhoneNumber:string];
    for (NSValue *result in curresults) {
        NSRange foundRange = result.rangeValue;
        [attStr setTextHighlightRange:foundRange color:color backgroundColor:[UIColor clearColor] tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSLog(@"电话");
        }];
    }
    return attStr;
}

+ (NSMutableAttributedString *)createStrWithWebPageAllStr:(NSString *)string AndWebPageColor:(UIColor *)color{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    //    NSString *str = [NSString stringWithFormat:@"%@",string];
    NSArray *curresults = [DataUtil analyzeURL:string];
    for (NSValue *result in curresults) {
        NSRange foundRange = result.rangeValue;
        [attStr setTextHighlightRange:foundRange color:color backgroundColor:[UIColor clearColor] tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSLog(@"开网页");
        }];
    }
    return attStr;
}

+ (NSMutableAttributedString *)createStrWithPhoneNUmAndWebPageAllStr:(NSString *)string AndPhoneNumcolor:(UIColor *)phoneColor AndWebPageColor:(UIColor *)webPageColor{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSArray *curresults1 = [DataUtil analyzeURL:string];
    for (NSValue *result in curresults1) {
        NSRange foundRange = result.rangeValue;
        [attStr setTextHighlightRange:foundRange color:phoneColor backgroundColor:[UIColor clearColor] tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSLog(@"开网页");
        }];
    }
    
    NSArray *curresults2 = [DataUtil analyzePhoneNumber:string];
    for (NSValue *result in curresults2) {
        NSRange foundRange = result.rangeValue;
        [attStr setTextHighlightRange:foundRange color:webPageColor backgroundColor:[UIColor clearColor] tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSLog(@"电话");
        }];
    }
    return attStr;
}

+ (NSMutableAttributedString *)changePriceIntegerbit:(NSString *)str andFont:(UIFont *)font andColor:(UIColor *)color{
    NSRange yRange = [str rangeOfString:@"¥"];
    NSRange dRange = [str rangeOfString:@"."];
    NSRange intergerRange;
    intergerRange.location = yRange.location + 1;
    intergerRange.length = dRange.location - yRange.location - 1;
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:str];
    [att addAttribute:NSFontAttributeName value:font range:intergerRange];
    [att addAttribute:NSForegroundColorAttributeName value:color  range:intergerRange];
    return att;
}
+ (NSString*)getStringbyDate:(NSDate*)date{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
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
        }else
            if(timelong < 3600)
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
+ (NSString*)getTimeString_YMD_byDate:(NSDate *)date{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    return [format stringFromDate:date];
}
@end



