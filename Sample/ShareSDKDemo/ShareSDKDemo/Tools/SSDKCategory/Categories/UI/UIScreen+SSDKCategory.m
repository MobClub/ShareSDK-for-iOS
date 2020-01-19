//
//  UIScreen+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UIScreen+SSDKCategory.h"
#import "UIDevice+SSDKCategory.h"
@implementation UIScreen (SSDKCategory)
+ (CGFloat)scale{
    static CGFloat screenScale = 0.0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([NSThread isMainThread]) {
            screenScale = [[UIScreen mainScreen] scale];
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                screenScale = [[UIScreen mainScreen] scale];
            });
        }
    });
    return screenScale;
}

+ (CGRect)bounds{
    return [UIScreen mainScreen].bounds;
}

+ (CGSize)size{
    return [UIScreen bounds].size;
}

+ (CGFloat)width{
    return [UIScreen size].width;
}

+ (CGFloat)height{
    return [UIScreen size].height;
}

+ (CGFloat)screenWidth{
    static CGFloat width = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen size];
        width = size.height < size.width?size.height:size.width;
    });
    return width;
}

+ (CGFloat)screenHeight{
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [UIScreen size];
        height = size.height > size.width?size.height:size.width;
    });
    return height;
}

+ (CGFloat)screenScale{
    static CGFloat scale = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [[UIDevice currentDevice] isPad]?1:ceil([UIScreen screenWidth] / 375 * 100) /100.0;
    });
    return scale;
}

/**
 当前设备屏幕边界
 */
#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
- (CGRect)currentBounds {
    return [self boundsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}
#endif

- (CGRect)boundsForOrientation:(UIInterfaceOrientation)orientation{
    CGRect bounds = [self bounds];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        CGFloat buffer = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = buffer;
    }
    return bounds;
}

@end
