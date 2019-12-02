//
//  UIButton+LimitTimes.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/10/11.
//  Copyright © 2019 bytedance.co. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MOBButtonLimitTimesTapBlock)(NSUInteger time, BOOL *stop, UIButton *button);

@interface UIButton (MOB)

#pragma mark - timeLimit -
//点击次数
@property (nonatomic, copy, readonly) UIButton * (^ buttonTapTime) (MOBButtonLimitTimesTapBlock block);

//时间间隔
@property (nonatomic, copy, readonly) UIButton* (^ tapSpaceTime) (NSTimeInterval spaceTime);

//取消之前de
- (void)cancelRecordTime;

@end

NS_ASSUME_NONNULL_END
