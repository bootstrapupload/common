//
//  BackgroundService.m
//  FiveCent
//
//  Created by XuQuan on 16/07/2017.
//  Copyright © 2017 zhouxiangzhong. All rights reserved.
//

#import "BackgroundService.h"

@interface BackgroundService (){
    int curcount;
}

@property (nonatomic,strong) NSTimer* timer;
@end
static BackgroundService* sharedinstance;
@implementation BackgroundService

+ (instancetype)sharedService{
    @synchronized(sharedinstance){
        if (sharedinstance == nil) {
            sharedinstance = [BackgroundService new];
        }
    }
    
    return sharedinstance;
}

- (void)startTimerWithCount:(int)count{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];//手动加入到NSRunLoop中
    curcount = count;
    [self.timer fire];
}

- (void)onTimer{
    curcount--;
    if (curcount == 0) {
        [self.timer invalidate];
    }
    
    if (tblock) {
        tblock(curcount);
    }
}

- (void)stopTimer{
    [self.timer invalidate];
}

- (void)setTimerBlock:(onTimerBlock)block{
    tblock = block;
}

- (void)startTimerWithCount:(int)count :(onTimerBlock)block{
    [self startTimerWithCount:count];
    [self setTimerBlock:block];
}

@end
