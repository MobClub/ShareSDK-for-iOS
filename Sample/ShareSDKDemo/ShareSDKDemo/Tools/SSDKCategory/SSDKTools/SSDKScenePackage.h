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

typedef NS_ENUM(NSUInteger, SSDKControllerShowType) {
    SSDKControllerShowTypeWindow = 0,//展示在新window中
    SSDKControllerShowTypeRootVC,//根视图展示
    SSDKControllerShowTypeCurrentVC,//当前显示控制器
    SSDKControllerShowTypeNavigationVC,//当前导航控制器
};

@interface UIViewController (SSDKScenePackage)

//展示方式
@property (nonatomic, copy, readonly) UIViewController * (^ showType)(SSDKControllerShowType type);

//是否以动画的形式展示
@property (nonatomic, copy, readonly) UIViewController * (^ showAnimated) (BOOL animated);

//多少秒后消失
@property (nonatomic, copy, readonly) UIViewController * (^ dismissTime)(NSTimeInterval dismissTime);


//是否以动画的形式消失
@property (nonatomic, copy, readonly) UIViewController * (^ dismissAnimated) (BOOL animated);

//push出的navigationBar是否隐藏
@property (nonatomic, copy, readonly) UIViewController * (^ navigationBarHidden)(BOOL isHidden);

//显示当前控制器
@property (nonatomic, copy, readonly) UIViewController *( ^ push) (void);

@property (nonatomic, copy, readonly) UIViewController *( ^ pushWithNavigation) (void (^ navigationConntroller)(UINavigationController *navigationController));

@property (nonatomic, copy, readonly) UIViewController *( ^ present) (void);

@end


@interface UIViewController (SSDKScenePackageLifeEvents)

- (void)addViewWillAppearBlock:(void (^) (UIViewController * vc, BOOL animated))block;

- (void)addViewDidLoadBlock:(void (^) (UIViewController * vc))block;

- (void)addViewDidAppearBlock:(void (^) (UIViewController * vc, BOOL animated))block;

- (void)addViewWillDisappearBlock:(void (^) (UIViewController * vc, BOOL animated))block;

- (void)addViewDidDisappearBlock:(void (^) (UIViewController * vc, BOOL animated))block;

- (void)addLoadViewBlock:(void (^) (UIViewController * vc))block;

@property (nonatomic, copy, readonly) UIViewController *  ( ^ ssdk_once)(BOOL once);


@end



NS_ASSUME_NONNULL_END
