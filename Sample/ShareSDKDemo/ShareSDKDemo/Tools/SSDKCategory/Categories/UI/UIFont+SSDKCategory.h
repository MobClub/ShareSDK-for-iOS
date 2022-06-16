//
//
//  SSDKCategory
//
//  Created by maxl on 2019/2/18.
//  Copyright © 2019 mob. All rights reserved.
//
#import <UIKit/UIKit.h>

#define Font(type,fontSize) [UIFont fontType:type size:fontSize]

#define Font_Scale(type,fontSize) [UIFont fontScaleType:type size:fontSize]

typedef NS_ENUM(NSInteger, fontType) {
    SystemFont = 0,
    PingFangLight,
    PingFangReguler,
    PingFangMedium,
    PingFangSemibold,
    STHeitiSCLight,
    STHeitiSCMedium,
    DinaAlternateBold
};

@interface UIFont (SSDKCategory)


+ (UIFont *)ssdk_fontScaleWithName:(NSString *)fontName fontSize:(CGFloat)fontSize;

+ (UIFont *)ssdk_fontWithName:(NSString *)fontName fontSize:(CGFloat)fontSize;

+ (UIFont *)fontType:(fontType)type size:(CGFloat)size;

+ (UIFont *)fontScaleType:(fontType)type size:(CGFloat)size;

+ (UIFont *)PingFangSCLightAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCRegularAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCMediumAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCScaleMediumAndSize:(CGFloat)size;

+ (UIFont *)PingFangSCSemiboldAndSize:(CGFloat)size;

+ (UIFont *)DINAlternateBoldAndSize:(CGFloat)size;

+ (UIFont *)STHeitiSCLightAndSize:(CGFloat)size;

+ (UIFont *)STHeitiSCMedium:(CGFloat)size;

+ (UIFont *)LatoBoldAndSize:(CGFloat)size;

@end
