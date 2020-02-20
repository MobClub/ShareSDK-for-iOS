//
//  UIApplication+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/7.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIApplication+SSDKCategory.h"
#import <sys/sysctl.h>
#import <mach/mach.h>
#import "UIDevice+SSDKCategory.h"
#import "UIView+SSDKCategory.h"
#import <pthread.h>
#import <objc/message.h>
#import "SSDKScenePackage.h"
#ifndef SSDKSYNTH_DYNAMIC_PROPERTY_OBJECT
#define SSDKSYNTH_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_)object { \
[self willChangeValueForKey:@#_getter_]; \
objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_ ## _association_); \
[self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
return objc_getAssociatedObject(self, @selector(_setter_:)); \
}
#endif

#define kNetworkIndicatorDelay (1/30.0)


@interface _SSDKUIApplicationNetworkIndicatorInfo : NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation _SSDKUIApplicationNetworkIndicatorInfo
@end

@implementation UIApplication (SSDKCategory)

+ (id)currentScene{
    return [SSDKScenePackage defaultPackage].currentScene;
}

+ (id)currentSceneDelegate{
    if ([self currentScene]) {
        return ((id (*)(id, SEL))objc_msgSend)([self currentScene],sel_registerName("delegate"));
    }
    return nil;
}

+ (BOOL)isSceneApp{
    return [SSDKScenePackage defaultPackage].isSceneApp;
}

+ (CGRect)statusBarFrame{
    return [SSDKScenePackage defaultPackage].statusBarFrame;
}

+ (UIWindow *)currentWindow{
    id wi = nil;
    for (UIWindow *window in [SSDKScenePackage defaultPackage].windows) {
        if (window.hidden == NO) {
            wi = window;
            break;
        }
    }
    return wi;
}

+ (UIWindow *)window{
    return [SSDKScenePackage defaultPackage].window;
}

+ (UIWindow *)currentKeyWindow{
    return [SSDKScenePackage defaultPackage].keyWindow;
}

+ (id)delegate{
    return [UIApplication sharedApplication].delegate;
}

+ (__kindof UIViewController *)rootViewController{
    return ([self keyWindow]?:[self window]).rootViewController;
}

+ (__kindof UIViewController *)currentTopViewController{
    
    UIViewController *vc = [self rootViewController];
    Class naVi = [UINavigationController class];
    Class tabbarClass = [UITabBarController class];
    BOOL isNavClass = [vc isKindOfClass:naVi];
    BOOL isTabbarClass = NO;
    if (!isNavClass) {
        isTabbarClass = [vc isKindOfClass:tabbarClass];
    }
    while (isNavClass || isTabbarClass) {
        UIViewController * top;
        if (isNavClass) {
          top = [(UINavigationController *)vc topViewController];
        }else{
          top = [(UITabBarController *)vc selectedViewController];
        }
        if (top) {
            vc = top;
        }else{
            break;
        }
        isNavClass = [vc isKindOfClass:naVi];
        if (!isNavClass) {
            isTabbarClass = [vc isKindOfClass:tabbarClass];
        }
    }
    return vc;
}

+ (UINavigationController *)currentToNavgationController{
    return [self currentTopViewController].view.navigationController;
}

+ (UIWindow *)keyWindow{
    return [SSDKScenePackage defaultPackage].keyWindow;
}



@end


