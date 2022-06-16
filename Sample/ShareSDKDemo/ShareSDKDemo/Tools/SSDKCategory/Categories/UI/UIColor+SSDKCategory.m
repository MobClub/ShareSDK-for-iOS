//
//  UIColor+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UIColor+SSDKCategory.h"
static inline NSUInteger hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

static BOOL hexStrToRGBA(NSString *str,
                         CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [[str stringByTrimmingCharactersInSet:set] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    if (length < 5) {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}
@implementation UIColor (SSDKCategory)

+ (UIColor *)ssdk_colorWithHexString:(NSString *)hexStr{
    return [self ssdk_colorWithHexString:hexStr alpha:-1];
}

+ (UIColor *)ssdk_colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha{
    CGFloat r, g, b, a;
    if (hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        if (@available(iOS 10.0, *)) {
            return [UIColor colorWithDisplayP3Red:r green:g blue:b alpha:alpha < 0?a : alpha];
        }else{
            return [UIColor colorWithRed:r green:g blue:b alpha:alpha < 0?a : alpha];
        }
    }
    return [UIColor whiteColor];
}

- (NSString *)ssdk_hexString{
    return [self ssdk_hexStringWithAplha:NO];
}

- (NSString *)ssdk_hexStringWithAplha{
    return [self ssdk_hexStringWithAplha:YES];
}

- (NSString *)ssdk_hexStringWithAplha:(BOOL)isWithAlpha{
    CGColorRef colorRef = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(colorRef);
    const CGFloat *compents = CGColorGetComponents(colorRef);
    static NSString *stringFormat = @"%02x%02x%02x";
    NSString *hex = nil;
    if (count == 2) {
        NSUInteger white = (NSUInteger)(compents[0] * 255.0f);
        hex = [NSString stringWithFormat:stringFormat,white,white,white];
    }else if (count == 4){
        hex = [NSString stringWithFormat:stringFormat,
               (NSUInteger)(compents[1] * 255.0f),
               (NSUInteger)(compents[2] * 255.0f),
               (NSUInteger)(compents[3] * 255.0f)
               ];
    }
    if (hex && isWithAlpha) {
        hex = [hex stringByAppendingFormat:@"%02lx",(unsigned long)(self.ssdk_alpha * 255.0 + 0.5)];
    }
    return hex;
}

+ (UIColor *)ssdk_randomColor{
    return [UIColor ssdk_percentR:arc4random() g:arc4random() b:arc4random() alpha:1];
}

+ (UIColor *)ssdk_percentR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha{
    if (@available(iOS 10.0, *)) {
        return [UIColor colorWithDisplayP3Red:r % 256 * 1.0 / 255 green:g % 256 * 1.0 / 255 blue:b % 256  * 1.0/  255 alpha:alpha];
    }else{
        return [UIColor colorWithRed:r % 256 * 1.0 / 255 green:g % 256 * 1.0 / 255 blue:b % 256  * 1.0/  255 alpha:alpha];
    }
}

- (UIColor *)ssdk_addColor:(UIColor *)acolor blendMode:(CGBlendMode)blendModel{
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big;
    uint8_t pixel[4] = {0};
    CGContextRef context = CGBitmapContextCreate(&pixel, 1, 1, 8, 4, colorspace, bitmapInfo);
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextSetBlendMode(context, blendModel);
    CGContextSetFillColorWithColor(context, acolor.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(colorspace);
    return [UIColor ssdk_percentR:pixel[0] g:pixel[1] b:pixel[2] alpha:pixel[3]];
}

- (CGFloat)ssdk_red {
    CGFloat r = 0, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)ssdk_green {
    CGFloat r, g = 0, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)ssdk_blue {
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

- (CGFloat)ssdk_alpha {
    return CGColorGetAlpha(self.CGColor);
}

- (CGFloat)ssdk_hue {
    CGFloat h = 0, s, b, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return h;
}

- (CGFloat)ssdk_saturation {
    CGFloat h, s = 0, b, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return s;
}

- (CGFloat)ssdk_brightness {
    CGFloat h, s, b = 0, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return b;
}


- (CGColorSpaceModel)ssdk_colorSpaceModel{
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (NSString *)ssdk_colorSpaceString {
    CGColorSpaceModel model =  CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    switch (model) {
        case kCGColorSpaceModelUnknown:
            return @"kCGColorSpaceModelUnknown";
            
        case kCGColorSpaceModelMonochrome:
            return @"kCGColorSpaceModelMonochrome";
            
        case kCGColorSpaceModelRGB:
            return @"kCGColorSpaceModelRGB";
            
        case kCGColorSpaceModelCMYK:
            return @"kCGColorSpaceModelCMYK";
            
        case kCGColorSpaceModelLab:
            return @"kCGColorSpaceModelLab";
            
        case kCGColorSpaceModelDeviceN:
            return @"kCGColorSpaceModelDeviceN";
            
        case kCGColorSpaceModelIndexed:
            return @"kCGColorSpaceModelIndexed";
            
        case kCGColorSpaceModelPattern:
            return @"kCGColorSpaceModelPattern";
            
        default:
            return @"ColorSpaceInvalid";
    }
}

- (UIColor *)ssdk_antiColor{
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    if (@available(iOS 10.0, *)) {
        return [UIColor colorWithDisplayP3Red:1-r green:1-g blue:1-b alpha:a];
    }else{
        return [UIColor colorWithRed:1-r green:1-g blue:1-b alpha:a];
    }
}

@end
