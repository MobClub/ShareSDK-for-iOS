//
//  UIImage+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SSDKCategory)

+ (nullable UIImage *)imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;

+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 根据颜色创建一个size大小的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 根据当前上下文画一个图片
 */
+ (UIImage *)imageSize:(CGSize)size withDrawContext:(void (^) (CGContextRef contextRef))drawContext;

/**
 是否有不透明
 */
- (BOOL)hasAlphaChannel;

/**
 动画图片
 */
+ (UIImage *)animatedGifName:(NSString *)name;

+ (UIImage *)animatedGifName:(NSString *)name scale:(CGFloat)scale;
/**
 修正图片
 */
- (UIImage *)imageByFixOrientation;

/**
根据当前视图和Model创建一个图片
 */
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentModel clipsToBounds:(BOOL)clips;


/**
 重新设置大小
 */
- (UIImage *)imageByResizeToSize:(CGSize)size;

/**
 等比例放大缩小
 */
- (UIImage *)imageByResizeToScale:(CGFloat)scale;

- (UIImage *)imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

/**
 裁剪
 */
- (UIImage *)imageByCropToRect:(CGRect)rect;

/**
 创建一个带边框的image
 */
- (UIImage *)imageByInsetEdge:(UIEdgeInsets)insets withColor:(UIColor *)color;


/**
 创建一个带圆角的image
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 旋转
 */
- (nullable UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;
- (nullable UIImage *)imageByRotateLeft90;
- (nullable UIImage *)imageByRotateRight90;
- (nullable UIImage *)imageByRotate180;
- (nullable UIImage *)imageByFlipVertical;
- (nullable UIImage *)imageByFlipHorizontal;

/**
 高斯模糊
 */
- (nullable UIImage *)imageByTintColor:(UIColor *)color;

- (nullable UIImage *)imageByGrayscale;

- (nullable UIImage *)imageByBlurSoft;


/**
 iOS设备
 */
- (nullable UIImage *)imageByBlurLight;

/**
 类似navgationBar

 */
- (nullable UIImage *)imageByBlurExtraLight;

/**
 类似通知中心
 */
- (nullable UIImage *)imageByBlurDark;
- (nullable UIImage *)imageByBlurWithTint:(UIColor *)tintColor;
- (nullable UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                              tintColor:(nullable UIColor *)tintColor
                               tintMode:(CGBlendMode)tintBlendMode
                             saturation:(CGFloat)saturation
                              maskImage:(nullable UIImage *)maskImage;

@end

static inline UIImage *UIImageNamed(NSString *imageName){
    if (![imageName isKindOfClass:[NSString class]] || imageName.length == 0) return nil;
    return [UIImage imageNamed:imageName];
}

NS_ASSUME_NONNULL_END
