//
//  SSDKScenePackage.h
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//兼容iOS13的处理类
@interface SSDKScenePackage : NSObject

+ (instancetype)defaultPackage;

//是否基于UIWindowScene
@property (nonatomic, assign, readonly) BOOL isSceneApp;

//当前活跃window
@property (nonatomic, copy, readonly) UIWindow *window;

//当前活跃的windows
@property (nonatomic, strong, readonly) NSArray <UIWindow *>* windows;

//当前活跃windowscene
@property (nonatomic, strong, readonly) id currentScene;

@property (nonatomic, copy, readonly) UIWindow *keyWindow;

@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@property (nonatomic, assign) BOOL statusBarHidden;

@property (nonatomic, assign, readonly) CGRect statusBarFrame;

@property (nonatomic, assign) UIInterfaceOrientation statusBarOrientation;

@property (nonatomic, assign) BOOL networkActivityIndicatorVisible;

//在window第一次加载后进行事件处理，可以保证block执行时必定加载过window
- (void)addBeforeWindowEvent:(void (^) (SSDKScenePackage *application))event;

@end

@interface UIViewController (SSDKScenePackage)

//弹出一个控制器后多少秒内消失
- (void)showInNewWindowAndDissmissAfterTime:(NSTimeInterval)time;

//全局弹出控制器，与当前界面完全独立
- (void)showInNewWindow;

@property (nonatomic, weak, readonly) UIViewController *( ^ show) (void);

@property (nonatomic, weak, readonly) UIViewController *( ^ showAnimated) (BOOL animated);

@end

NS_ASSUME_NONNULL_END
