//
//  UIScreen+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (SSDKCategory)

+ (CGFloat)scale;

+ (CGRect)bounds;

+ (CGSize)size;

+ (CGFloat)width;

+ (CGFloat)height;


/**
 宽度，恒定
 */
+ (CGFloat)screenWidth;

/**
 高度，恒定
 */
+ (CGFloat)screenHeight;

/**
 适配比例
 */
+ (CGFloat)screenScale;

/**
 当前设备屏幕边界
 */
- (CGRect)currentBounds NS_EXTENSION_UNAVAILABLE_IOS("");

- (CGRect)boundsForOrientation:(UIInterfaceOrientation)orientation;

@end

NS_ASSUME_NONNULL_END
