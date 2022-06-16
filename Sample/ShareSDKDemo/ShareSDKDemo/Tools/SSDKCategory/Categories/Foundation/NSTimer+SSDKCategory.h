//
//  NSTimer+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSTimer (SSDKCategory)

/**
 自动开始
 */
+ (NSTimer *)scheduledTimerWithBlock:(void (^) (NSTimer *timer))block timeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats;

/**
 需要手动开始
 */
+ (NSTimer *)timerWithBlock:(void (^) (NSTimer *timer))block timeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
