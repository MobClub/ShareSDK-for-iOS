//
//  SSUIEditorViewStyle.h
//  ShareSDKUI
//
//  Created by chenjd on 15/7/15.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSUIEditorViewStyle : NSObject

/**
*  设置导航栏背景
*
*  @param image 背景图片
*/
+ (void)setiPhoneNavigationBarBackgroundImage:(UIImage *)image;

/**
 *  设置iPhone导航栏颜色
 *
 *  @param color 背景颜色
 */
+ (void)setiPhoneNavigationBarBackgroundColor:(UIColor *)color;

/**
 *  设置iPad导航栏颜色
 *
 *  @param color 背景颜色
 */
+ (void)setiPadNavigationBarBackgroundColor:(UIColor *)color;

/**
 *  设置编辑界面背景颜色
 *
 *  @param color 背景颜色
 */
+ (void)setContentViewBackgroundColor:(UIColor *)color;

/**
 *  设置标题
 *
 *  @param title 标题
 */
+ (void)setTitle:(NSString *)title;

/**
 *  设置标题文本颜色
 *
 *  @param color 颜色
 */
+ (void)setTitleColor:(UIColor *)color;

/**
 *  设置取消按钮标签
 *
 *  @param label 取消按钮标签
 */
+ (void)setCancelButtonLabel:(NSString *)label;

/**
 *  设置取消按钮标签文本颜色
 *
 *  @param color 颜色
 */
+ (void)setCancelButtonLabelColor:(UIColor *)color;

/**
 *  设置取消按钮背景
 *
 *  @param image 图片
 */
+ (void)setCancelButtonImage:(UIImage *)image;

/**
 *  设置分享按钮标签
 *
 *  @param label 取消按钮标签
 */
+ (void)setShareButtonLabel:(NSString *)label;

/**
 *  设置分享按钮标签文本颜色
 *
 *  @param color 颜色
 */
+ (void)setShareButtonLabelColor:(UIColor *)color;

/**
 *  设置分享按钮背景
 *
 *  @param image 图片
 */
+ (void)setShareButtonImage:(UIImage *)image;

/**
 *  设置支持的页面方向（单独分享编辑页面）
 */
+ (void)setSupportedInterfaceOrientation:(UIInterfaceOrientationMask)toInterfaceOrientation;

/**
 *  设置分享编辑页面状态栏风格
 */
+ (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle;

@end
