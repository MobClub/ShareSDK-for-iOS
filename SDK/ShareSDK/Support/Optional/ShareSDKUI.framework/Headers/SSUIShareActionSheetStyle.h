//
//  SSUIShareActionSheetStyle.h
//  ShareSDKUI
//
//  Created by 刘 靖煌 on 15/7/15.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSUIShareActionSheetStyle : NSObject

/**
 *  ShareSDK UI风格
 */
typedef NS_ENUM(NSInteger, ShareActionSheetStyle)  {
    ShareActionSheetStyleSystem     = 0,    // 系统类型，默认
    ShareActionSheetStyleSimple     = 1,    // 简洁类型
};

/**
 *  设置ShareSDK UI风格
 */
+ (void)setShareActionSheetStyle:(ShareActionSheetStyle)style;

/**
 *  设置分享菜单栏颜色
 *
 *  @param color 背景颜色
 */
+ (void)setActionSheetColor:(UIColor *)color;

/**
 *  设置分享菜单栏的背景颜色
 *
 *  @param color 背景颜色
 */
+ (void)setActionSheetBackgroundColor:(UIColor *)color;

/**
 *  设置标题文本颜色
 */
+ (void)setItemNameColor:(UIColor *)color;

/**
 *  设置标题文本字体
 */
+ (void)setItemNameFont:(UIFont *)font;

/**
 *  设置取消按钮标签文本颜色
 *
 *  @param color 颜色
 */
+ (void)setCancelButtonLabelColor:(UIColor *)color;

/**
 *  设置取消按钮标签字体
 */
+ (void)setCancelButtonBackgroundColor:(UIColor *)color;

/**
 *  设置UIPageControl的Indicator的颜色
 */
+ (void)setPageIndicatorTintColor:(UIColor *)color;

/**
 *  设置UIPageControl当前页的Indicator的颜色
 */
+ (void)setCurrentPageIndicatorTintColor:(UIColor *)color;

/**
 *  设置支持的页面方向（单独控制分享菜单栏）
 */
+ (void)setSupportedInterfaceOrientation:(UIInterfaceOrientationMask)toInterfaceOrientation;

/**
 *  设置分享菜单栏状态栏风格
 */
+ (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle;

/**
 *  取消按钮是否隐藏，默认不隐藏
 */
+ (void)isCancelButtomHidden:(BOOL)isCancelButtomHidden;

@end
