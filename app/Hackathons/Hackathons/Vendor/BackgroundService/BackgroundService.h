//
//  BackgroundService.h
//  FiveCent
//
//  Created by XuQuan on 16/07/2017.
//  Copyright © 2017 zhouxiangzhong. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^onTimerBlock)(int count);
@interface BackgroundService : NSObject{
    onTimerBlock tblock;
}

+ (instancetype)sharedService;
- (void)startTimerWithCount:(int)count; // fire
- (void)stopTimer;
- (void)setTimerBlock:(onTimerBlock)block; //bind

- (void)startTimerWithCount:(int)count :(onTimerBlock)block;
@end
