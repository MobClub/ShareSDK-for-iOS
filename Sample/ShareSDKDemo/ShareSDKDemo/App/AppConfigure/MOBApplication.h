//
//  SSDKShareWindow.h
//  ShareSDK
//
//  Created by maxl on 2019/9/9.
//  Copyright © 2019 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOBApplication : NSObject

+ (MOBApplication *)sharedApplication;

@property (nonatomic, assign, readonly) BOOL isSceneApp;

/**
 iOS13基于UIScene：
 1.若当前只有一个激活的window，则获取当前激活的window
 2.否则，获取最近点击的window
 
 否则：
 获取application的代理的window
 */
@property (nonatomic, strong, readonly) UIWindow *window;

@property (nonatomic, strong, readonly) NSArray <UIWindow *>* windows;

@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@property (nonatomic, assign) BOOL statusBarHidden;

@property (nonatomic, assign, readonly) CGRect statusBarFrame;

@property (nonatomic, assign) UIInterfaceOrientation statusBarOrientation;

@property (nonatomic, assign) BOOL networkActivityIndicatorVisible;

/// 在iOS13.0调用后将当前window加载到windowScene上
- (void)showWindow:(UIWindow *)window;

//此方法可保证一定在application的window第一次初始化加载完成后调用
- (void)addBeforeWindowEvent:(void (^) (MOBApplication *application))event;

@end

NS_ASSUME_NONNULL_END
 
