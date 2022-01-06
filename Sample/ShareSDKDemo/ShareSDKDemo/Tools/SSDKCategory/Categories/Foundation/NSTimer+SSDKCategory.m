//
//  NSTimer+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import "NSTimer+SSDKCategory.h"

@implementation NSTimer (SSDKCategory)

+ (void)ssdk_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithBlock:(void (^) (NSTimer *timer))block timeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats{
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(ssdk_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithBlock:(void (^) (NSTimer *timer))block timeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats{
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(ssdk_ExecBlock:) userInfo:[block copy] repeats:repeats];
}


@end
