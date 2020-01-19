//
//  UIColor+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SSDKCategory)

+ (UIColor *)ssdk_colorWithHexString:(NSString *)hexString;

+ (UIColor *)ssdk_colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

+ (UIColor *)ssdk_randomColor;

+ (UIColor *)ssdk_percentR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;

- (NSString *)ssdk_hexString;

- (NSString *)ssdk_hexStringWithAplha;

- (UIColor *)ssdk_addColor:(UIColor *)acolor blendMode:(CGBlendMode)blendModel;

@property (nonatomic, assign, readonly) CGFloat  ssdk_red;

@property (nonatomic, assign, readonly) CGFloat  ssdk_green;

@property (nonatomic, assign, readonly) CGFloat  ssdk_blue;

@property (nonatomic, assign, readonly) CGFloat  ssdk_alpha;

@property (nonatomic, assign, readonly) CGFloat  ssdk_hue;

@property (nonatomic, assign, readonly) CGFloat  ssdk_saturation;

@property (nonatomic, assign, readonly) CGFloat  ssdk_brightness;

@property (nonatomic, readonly) CGColorSpaceModel ssdk_colorSpaceModel;

@property (nonatomic, readonly) NSString *ssdk_colorSpaceString;

/**
 反色调
 */
- (UIColor *)ssdk_antiColor;

@end

static inline UIColor *UIColorHexString(NSString *hexString){
    return [UIColor ssdk_colorWithHexString:hexString];
}

static inline UIColor *UIColorHexAlpha(NSString *hexString, CGFloat alpha){
    return [UIColor ssdk_colorWithHexString:hexString alpha:alpha];
}
static inline UIColor *UIColorRGBAlpha(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor ssdk_percentR:r g:g b:b alpha:alpha];
}
static inline UIColor *UIColorRGB(CGFloat r, CGFloat g, CGFloat b){
    return UIColorRGBAlpha(r,g,b,1);
}
static inline UIColor *UIColorRGBAlphaPercent(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha){
    return [UIColor ssdk_percentR:r * 255.0 g:g * 255.0 b:b * 255.0 alpha:alpha];
}
static inline UIColor *UIColorRGBPercent(CGFloat r, CGFloat g, CGFloat b){
    return UIColorRGBAlphaPercent(r,g,b,1);
}


#define SSDKRGBAlphaPercent(r,g,b,a) UIColorRGBAlphaPercent(r,g,b,a)

#define SSDKRGBPercent(r,g,b) UIColorRGBPercent(r,g,b)

#define SSDKRGBAlpha(r,g,b,a) UIColorRGBAlpha(r,g,b,a)

#define SSDKRGB(r,g,b) UIColorRGB(r,g,b)

NS_ASSUME_NONNULL_END
