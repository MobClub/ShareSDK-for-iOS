//
//  SSDKAuthViewStyle_Private.h
//  ShareSDK
//
//  Created by fenghj on 15/6/25.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//
#ifdef __INNER_HEAD__

#import "SSDKAuthViewStyle.h"

#else

#import <ShareSDK/SSDKAuthViewStyle.h>

#endif

@interface SSDKAuthViewStyle ()

/**
 *  导航栏背景图片
 */
@property (nonatomic, strong) UIImage *navigationbarBackgroundImage;

/**
 *  导航栏背景颜色
 */
@property (nonatomic, strong) UIColor *navigationbarBackgroundColor;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  标题文本颜色
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 *  取消按钮标签文本
 */
@property (nonatomic, copy) NSString *cancelButtonLabel;

/**
 *  取消按钮标签文本颜色
 */
@property (nonatomic, strong) UIColor *cancelButtonLabelColor;

/**
 *  取消按钮背景图片
 */
@property (nonatomic, strong) UIImage *cancelButtonImage;

/**
 *  取消按钮左边距
 */
@property (nonatomic) CGFloat cancelButtonLeftMargin;

/**
 *  右边按钮标签文本
 */
@property (nonatomic, strong) UIButton *rightButton;

/**
 *  右边按钮右边边距
 */
@property (nonatomic) CGFloat rightButtonRightMargin;

/**
 *  支持的方向
 */
@property (nonatomic, assign) UIInterfaceOrientationMask supportedInterfaceOrientation;

/**
 *  状态栏样式
 */
@property (nonatomic) UIStatusBarStyle statusBarStyle;

/**
 *  获取授权视图风格共享实例
 *
 *  @return 风格实例
 */
+ (instancetype)sharedInstance;

@end
