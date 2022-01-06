//
//  UIButton+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+SSDKCategory.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SSDKButtonImageDirection) {
    SSDKButtonImageDirectionTop,
    SSDKButtonImageDirectionLeft,
    SSDKButtonImageDirectionRight,
    SSDKButtonImageDirectionBottom,
};

typedef void(^SSDKButtonLimitTimesTapBlock)(NSUInteger time, BOOL *stop, UIButton *button);

@interface UIButton (SSDKCategory)


- (void)imageDirection:(SSDKButtonImageDirection)direction space:(CGFloat)space;



#pragma mark - 限制点击次数 -
//点击次数
@property (nonatomic, copy, readonly) UIButton * (^ buttonTapTime) (SSDKButtonLimitTimesTapBlock block);

//时间间隔
@property (nonatomic, copy, readonly) UIButton* (^ tapSpaceTime) (NSTimeInterval spaceTime);

//清除限制
- (void)cancelRecordTime;


@end

NS_ASSUME_NONNULL_END
