//
//  SSDKDefine.h
//  SSDKCategory
//
//  Created by maxl on 2018/11/20.
//  Copyright © 2018 mob. All rights reserved.
//


#ifndef SSDKDefine_h
#define SSDKDefine_h
#import <UIKit/UIKit.h>

static inline CGFloat SSDKRadiansToDegrees(CGFloat radians) {
    
    return radians * 180 / M_PI;
}

static inline CGFloat SSDKDegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

#ifndef SSDK_SWAP // swap two value
#define SSDK_SWAP(_a_, _b_)  do { __typeof__(_a_) _tmp_ = (_a_); (_a_) = (_b_); (_b_) = _tmp_; } while (0)
#endif

#define SSDK_WIDTH [UIScreen screenWidth]

#define SSDK_HEIGHT [UIScreen screenHeight]

#define SSDK_SCALE [UIScreen screenScale]

//仅仅是状态栏的高度
#define kStatusBarHeight (SSDKSafeArea([UIApplication window]).top)

//当前显示的navigationbar的高度
#define kNavigationBarHeight \
({\
    CGFloat height = 0;\
    UINavigationBar *bar = [UIApplication currentTopViewController].navigationController.navigationBar;\
    if (!bar.isHidden) {\
    height = bar.height + kStatusBarHeight;\
    }\
    height;\
})

#define kDefaultNavigationBarHeight (SSDKSafeArea([UIApplication window]).top + 44)

//这个高度如果有tabbar高度则包含tabbar高度，否则不包含
#define KHomeIndicatorHeight (SSDKSafeArea([UIApplication currentTopViewController].view).bottom)

//这个高度只是tabbarHeight的高度
#define KTabbarHeight ([UIApplication rootViewController].tabBarController.tabBar.height)

#define SSDKSafeArea(view)\
({\
UIEdgeInsets safeInsets = UIEdgeInsetsMake(20, 0, 0, 0);\
if(view){\
static IMP imp = _objc_msgForward;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
    Method method = class_getInstanceMethod([view class], sel_registerName("safeAreaInsets"));\
    if (method) {\
        imp = method_getImplementation(method);\
    }\
});\
if (imp != _objc_msgForward) {\
   safeInsets = ((UIEdgeInsets (*)(id, SEL))imp)(view,sel_registerName("safeAreaInsets"));\
}\
}\
safeInsets;\
})
#define SSDKWEAK  __weak typeof(self)weakSelf = self;
#define SSDKSTRONG  __strong typeof(weakSelf)self = weakSelf;



#endif /* SSDKDefine_h */
