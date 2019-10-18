//
//  SSDKShareWindow.m
//  ShareSDK
//
//  Created by maxl on 2019/9/9.
//  Copyright © 2019 掌淘科技. All rights reserved.
//

#import "MOBApplication.h"
#import <objc/message.h>

typedef enum : NSUInteger {
    MOBSceneHookStatusNotNeed,
    MOBSceneHookStatusUnstart,
    MOBSceneHookStatusNeed,
    MOBSceneHookStatusDone,
} MOBSceneHookStatus;
@interface MOBApplication ()

@property (nonatomic, assign) BOOL isSceneApp;

@property (nonatomic, weak) UIWindow *currentClickWindow;

@property (nonatomic, assign) BOOL isLoadFirstWindow;

@property (nonatomic, strong) NSMutableArray * events;

@property (nonatomic, strong) NSMutableSet * hookDelegateClass;

@property (nonatomic, strong) id hooker;

@property (nonatomic, assign) MOBSceneHookStatus sceneHookStatus;

@end

@implementation MOBApplication

+ (MOBApplication *)sharedApplication{
    static MOBApplication *app = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        app = [MOBApplication new];
    });
    return app;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
        [self hookDelegateClass];
        _hooker = [NSClassFromString(@"MOBExchangeImpHooker") new];
    }
    return self;
}
- (void)configure{
    if (@available(iOS 13.0, *)) {
        if ([[[UIApplication sharedApplication] delegate] respondsToSelector:NSSelectorFromString(@"application:configurationForConnectingSceneSession:options:")]) {
            _isSceneApp = YES;
        }else{
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
            NSMutableDictionary *infoDict = [NSMutableDictionary dictionaryWithContentsOfFile:bundlePath];
            NSDictionary *sceneManifest = infoDict[@"UIApplicationSceneManifest"];
            if (sceneManifest) {
                id supportsMiltipleScenes = sceneManifest[@"UIApplicationSupportsMultipleScenes"];
                if (supportsMiltipleScenes) {
                    if ([supportsMiltipleScenes integerValue] == 1) {
                        _isSceneApp = YES;
                    }else{
                        NSDictionary *configurationDic = sceneManifest[@"UISceneConfigurations"];
                        if (configurationDic.count > 0) {
                            BOOL(^isValue)(NSString *) = ^(NSString *name) {
                                NSArray *role = configurationDic[name];
                                if ([role isKindOfClass:[NSArray class]] && [role count] > 0) {
                                    return YES;
                                }
                                return NO;
                            };
                            NSArray *keys = @[@"UIWindowSceneSessionRoleApplication", @"UIWindowSceneSessionRoleExternalDisplay", @"CPTemplateApplicationSceneSessionRoleApplication"];
                            for (NSString *key in keys) {
                                if (isValue(key)) {
                                    _isSceneApp = YES;
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        if (_isSceneApp) {
            _sceneHookStatus = MOBSceneHookStatusNeed;
        }else{
            _sceneHookStatus = MOBSceneHookStatusUnstart;
        }
    }else{
        _sceneHookStatus = MOBSceneHookStatusNotNeed;
        _isLoadFirstWindow = YES;
    }
    
}

- (UIWindow *)window{
    if (!_isSceneApp) return self.currentClickWindow?:[UIApplication sharedApplication].delegate.window;
    NSArray *set = ((NSSet* (*)(id, SEL))objc_msgSend)(UIApplication.sharedApplication,sel_registerName("connectedScenes")).allObjects;
    id delegate;
    if (set.count == 1){
        delegate = ((id (*)(id, SEL))objc_msgSend)(set[0],sel_registerName("delegate"));
    }else{
        NSInteger lastIndex = -1;
        NSInteger count = 0;
        for (int i = 0; i < set.count; i++) {
            id windowScene = set[i];
            NSInteger status = ((NSInteger (*)(id, SEL))objc_msgSend)(windowScene,sel_registerName("activationState"));
            if (status == 0) {
                count++;
                lastIndex = i;
                if (count > 0) {
                    break;
                }
            }
        }
        if (lastIndex!=-1 && count==1) {
            delegate = ((id (*)(id, SEL))objc_msgSend)(set[lastIndex],sel_registerName("delegate"));
        }else if(self.currentClickWindow == nil){
            delegate = ((id (*)(id, SEL))objc_msgSend)([set firstObject],sel_registerName("delegate"));
        }
    }
    
    if (delegate) {
        return ((UIWindow* (*)(id, SEL))objc_msgSend)(delegate,sel_registerName("window"));
    }
    return self.currentClickWindow;
}


- (NSArray<UIWindow *> *)windows{
    if (_isSceneApp) {
        id windowScene = ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
        NSArray *windows = ((NSArray <UIWindow *>* (*)(id, SEL))objc_msgSend)(windowScene,sel_registerName("windows"));
        return windows;
    }else{
        return [UIApplication sharedApplication].windows;
    }
}


- (void)showWindow:(UIWindow *)window{
    if (_isSceneApp) {
        SEL sel = sel_registerName("setWindowScene:");
        IMP imp = method_getImplementation(class_getInstanceMethod(objc_getClass("UIWindow"), sel));
        id windowScene = ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
        ((void (*) (id , SEL, id))imp)(window, sel, windowScene);
    }
}

- (void)clickUpdateWindow:(UIWindow *)window{
    if (@available(iOS 13.0, *)) {
        if (((id (*)(id, SEL))objc_msgSend)(self.currentClickWindow,sel_registerName("windowScene"))==((id (*)(id, SEL))objc_msgSend)(window,sel_registerName("windowScene"))) return;
    }else{
        if (self.currentClickWindow == window) return;
    }
    
    self.currentClickWindow = window;
}


#pragma mark - statusBar -

- (CGRect)statusBarFrame{
    if (_isSceneApp) {
        id windowScene = ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
        id statusBarManager = ((id (*)(id, SEL))objc_msgSend)(windowScene,sel_registerName("statusBarManager"));
        return ((CGRect (*)(id, SEL))objc_msgSend)(statusBarManager,_cmd);
    }else{
        return [UIApplication sharedApplication].statusBarFrame;
    }
}


- (BOOL)statusBarHidden{
    if (_isSceneApp) {
        id windowScene = ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
        id statusBarManager = ((id (*)(id, SEL))objc_msgSend)(windowScene,sel_registerName("statusBarManager"));
        return ((BOOL (*)(id, SEL))objc_msgSend)(statusBarManager,_cmd);
    }else{
        return [UIApplication sharedApplication].statusBarHidden;
    }
}

- (void)setStatusBarHidden:(BOOL)statusBarHidden{
    [UIApplication sharedApplication].statusBarHidden = statusBarHidden;
}

- (UIStatusBarStyle)statusBarStyle{
    if (_isSceneApp) {
        id windowScene = ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
        id statusBarManager = ((id (*)(id, SEL))objc_msgSend)(windowScene,sel_registerName("statusBarManager"));
        return ((UIStatusBarStyle (*)(id, SEL))objc_msgSend)(statusBarManager,_cmd);
    }else{
        return [UIApplication sharedApplication].statusBarStyle;
    }
}
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle{
    [UIApplication sharedApplication].statusBarStyle = statusBarStyle;
}

- (UIInterfaceOrientation)statusBarOrientation{
    if (_isSceneApp) {
        id windowScene = ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
        return ((UIInterfaceOrientation (*)(id, SEL))objc_msgSend)(windowScene,sel_registerName("interfaceOrientation"));
    }else{
        return [UIApplication sharedApplication].statusBarOrientation;
    }
}

- (void)setStatusBarOrientation:(UIInterfaceOrientation)statusBarOrientation{
    [UIApplication sharedApplication].statusBarOrientation = statusBarOrientation;
}

- (BOOL)networkActivityIndicatorVisible{
    return [UIApplication sharedApplication].networkActivityIndicatorVisible;
}

- (void)setNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
}
#pragma mark - 懒加载 -

- (NSMutableSet *)hookDelegateClass{
    if (!_hookDelegateClass) {
        _hookDelegateClass = [NSMutableSet new];
    }
    return _hookDelegateClass;
}

#pragma mark - 异步 -

- (NSMutableArray *)events{
    if (!_events) {
        _events = [NSMutableArray array];
    }
    return _events;
}

- (void)setIsLoadFirstWindow:(BOOL)isLoadFirstWindow{
    if (_events.count == 0) {
        _isLoadFirstWindow = isLoadFirstWindow;
    }else{
        if (!_isLoadFirstWindow && isLoadFirstWindow) {
            @synchronized (self.events) {
                for (void (^ block)(MOBApplication * _Nonnull) in self.events) {
                    
                    block(self);
                }
                [self.events removeAllObjects];
            }
        }
        _isLoadFirstWindow = isLoadFirstWindow;
    }
}

- (void)addBeforeWindowEvent:(void (^)(MOBApplication * _Nonnull))event{
    if (_isLoadFirstWindow) {
        dispatch_async(dispatch_get_main_queue(), ^{
            event(self);
        });
    }else{
        @synchronized (self.events) {
            [self.events addObject:[event copy]];
        }
    }
}
@end

NSMutableDictionary *MOBHookClassMap(){
    static NSMutableDictionary *map = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = [NSMutableDictionary dictionary];
    });
    return map;
}
/// 方法交换,hooedSelector不可重复
/// @param hookClass  需要操作的类
/// @param hookSelector 需要操作的方法
/// @param hookedClass 被交换的类
/// @param hookedSelector 被交换的方法

void MOBHookClassMethod(Class hookClass,SEL hookSelector, Class hookedClass, SEL hookedSelector){
    if (!hookClass||!hookSelector||!hookedSelector||!hookedClass) return;
    
    NSString *hookClassName = NSStringFromClass(hookClass);
    NSString *identify = [[@[hookClassName,NSStringFromClass(hookedClass),NSStringFromSelector(hookSelector),NSStringFromSelector(hookedSelector)] sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }] componentsJoinedByString:@"-"];
    
    Method (^getMethod)(Class, SEL) = ^(Class class, SEL sel) {
        Method method = class_getInstanceMethod(class, sel);
        if (method == NULL) {
            method = class_getClassMethod(class, sel);
        }
        return method;
    };
    void(^ MOBReplaceHookedSelectorToHookClass)(void) = ^{
        Method hookMethod = getMethod(hookedClass,hookedSelector);
        IMP hookImp = method_getImplementation(hookMethod);
        if (class_addMethod(hookClass, hookedSelector, hookImp, method_getTypeEncoding(hookMethod))) {
            
        }
    };
    @synchronized (MOBHookClassMap()) {
        NSMutableArray *value = [MOBHookClassMap() objectForKey:identify];
        if (value) {
            if ([value containsObject:hookClassName]) return;
            //之前已经交换过了,只不过hookClass与hookedClass交换了
            //只需要给hookClass添加hookedSelector方法
            [value addObject:hookClassName];
            MOBReplaceHookedSelectorToHookClass();
            return;
        }
        value = [NSMutableArray array];
        [value addObject:hookClassName];
        [MOBHookClassMap() setValue:value forKey:identify];
        Method hookMethod = getMethod(hookClass,hookSelector);
        Method hookedMethod = getMethod(hookedClass,hookedSelector);
        IMP hookImp = method_getImplementation(hookMethod);
        IMP hookedImp = method_getImplementation(hookedMethod);
        if (hookImp == _objc_msgForward || hookedImp == _objc_msgForward) return;
        
        if (class_addMethod(hookClass, hookSelector, hookedImp, method_getTypeEncoding(hookedMethod))) {
            class_replaceMethod(hookedClass, hookedSelector, hookImp, method_getTypeEncoding(hookMethod));
        }else{
            method_exchangeImplementations(hookedMethod, hookMethod);
        }
        class_addMethod(hookClass, hookedSelector, hookImp, method_getTypeEncoding(hookMethod));
    }
}

@interface MOBExchangeImpHooker : NSObject

@end
static inline void MOBHookSceneApp (){
    @synchronized ([MOBApplication sharedApplication]) {
        
        if ([MOBApplication sharedApplication].sceneHookStatus == MOBSceneHookStatusNeed && [MOBApplication sharedApplication].isSceneApp) {
            MOBHookClassMethod(NSClassFromString(@"UIWindowScene"), sel_registerName("initWithSession:connectionOptions:"), MOBExchangeImpHooker.class, sel_registerName("__initWithSession:connectionOptions:"));
            MOBHookClassMethod(NSClassFromString(@"UIWindowScene"), sel_registerName("setDelegate:"), MOBExchangeImpHooker.class, sel_registerName("__setDelegate:"));
            MOBHookClassMethod(NSClassFromString(@"UIWindow"), sel_registerName("hitTest:withEvent:"), MOBExchangeImpHooker.class, sel_registerName("__hitTest:withEvent:"));
            [MOBApplication sharedApplication].sceneHookStatus = MOBSceneHookStatusDone;
        }
    }
    
    
}
@implementation MOBExchangeImpHooker

- (id)__initWithSession:(id)session connectionOptions:(id)options
{
    id obj = [self __initWithSession:session connectionOptions:options];
    [[MOBApplication sharedApplication].hooker setScene:obj];
    return obj;
}
- (void)__setDelegate:(id)delegate{
    [[MOBApplication sharedApplication].hooker hookSceneDelegate:delegate];
    [self __setDelegate:delegate];
}

- (void)__scene:(id)scene willConnectToSession:(id)session options:(id)connectionOptions{
    [self __scene:scene willConnectToSession:session options:connectionOptions];
    [[MOBApplication sharedApplication] setIsLoadFirstWindow:YES];
}

- (UIView *)__hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [self __hitTest:point withEvent:event];
    if (view) {
        [[MOBApplication sharedApplication] clickUpdateWindow:view.window];
    }
    return view;
}
- (void)__setAppDelegate:(id)delegate{
    [self __setAppDelegate:delegate];
    if ([MOBApplication sharedApplication].sceneHookStatus == MOBSceneHookStatusUnstart) {
        if ([delegate respondsToSelector:NSSelectorFromString(@"application:configurationForConnectingSceneSession:options:")]) {
            [MOBApplication  sharedApplication].sceneHookStatus = MOBSceneHookStatusNeed;
            [MOBApplication sharedApplication].isSceneApp = YES;
            MOBHookSceneApp();
        }else{
            [MOBApplication sharedApplication].isLoadFirstWindow = YES;
        }
    }
}
- (void)hookSceneDelegate:(id)delegate{
    if (!delegate) return;
    @synchronized ([MOBApplication sharedApplication].hookDelegateClass) {
        NSString *className = NSStringFromClass([delegate class]);
        if ([[MOBApplication sharedApplication].hookDelegateClass containsObject:className])return;
        MOBHookClassMethod([delegate class], sel_registerName("scene:willConnectToSession:options:"), MOBExchangeImpHooker.class, sel_registerName("__scene:willConnectToSession:options:"));
        [[MOBApplication sharedApplication].hookDelegateClass addObject:className];
    }
}
- (void)setScene:(id)scene{
    if (!scene) return;
    if ([scene respondsToSelector:sel_registerName("delegate")]) {
        id delegate = ((id (*)(id, SEL))objc_msgSend)(scene,sel_registerName("delegate"));
        [self hookSceneDelegate:delegate];
    }
}

@end


__attribute__((constructor)) static void MOBApplicationExcImp(){
    MOBHookSceneApp();
    MOBHookClassMethod(NSClassFromString(@"UIApplication"), sel_registerName("setDelegate:"), MOBExchangeImpHooker.class, sel_registerName("__setAppDelegate:"));
}
