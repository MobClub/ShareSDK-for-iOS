//
//  SSDKScenePackage.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/12/9.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKScenePackage.h"
#import "NSObject+SSDKCategory.h"
#import <objc/message.h>

typedef enum : NSUInteger {
    SSDKScenePackageSceneHookStatusUndefine,
    SSDKScenePackageSceneHookStatusUnstart,
    SSDKScenePackageSceneHookStatusNeed,
    SSDKScenePackageSceneHookStatusDone
} SSDKScenePackageSceneHookStatus;

@interface SSDKScenePackage ()

@property (nonatomic, assign) BOOL isSceneApp;

@property (nonatomic, assign) BOOL isLoadFirstWindow;

@property (nonatomic, strong) NSMutableArray *alertWindows;

@property (nonatomic, strong) NSMutableArray * events;

@property (nonatomic, strong) NSMutableSet * hookDelegateClassNames;

@property (nonatomic, strong) NSMutableSet * hookApplicationClassNames;

@property (nonatomic, assign) SSDKScenePackageSceneHookStatus hookSceneStatus;

@property (nonatomic, weak) UIWindow *currentClickWindow;

@end

@implementation SSDKScenePackage

+ (instancetype)defaultPackage{
    static SSDKScenePackage *package = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        package = [SSDKScenePackage new];
    });
    return package;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
        _hookDelegateClassNames = [NSMutableSet set];
        _hookApplicationClassNames = [NSMutableSet set];
        _alertWindows = [NSMutableArray array];
    }
    return self;
}

- (void)configure{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 13.0) {
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
        if (_isSceneApp) {
            _hookSceneStatus = SSDKScenePackageSceneHookStatusNeed;
        }else{
            _hookSceneStatus = SSDKScenePackageSceneHookStatusUnstart;
        }
        
    }else{
        _hookSceneStatus = SSDKScenePackageSceneHookStatusUndefine;
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
                lastIndex = i;
                count++;
                if (count > 1) break;
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

- (id)currentScene{
    if (self.window && _isSceneApp) {
        return ((id (*)(id, SEL))objc_msgSend)(self.window,sel_registerName("windowScene"));
    }
    return nil;
}

- (UIWindow *)keyWindow{
    for (UIWindow *win in self.windows) {
        if (win.isKeyWindow) {
            return win;
        }
    }
    return nil;
}



- (void)showWindow:(UIWindow *)window{
    if (self.currentScene) {
        SEL sel = sel_registerName("setWindowScene:");
        IMP imp = method_getImplementation(class_getInstanceMethod(objc_getClass("UIWindow"), sel));
        ((void (*) (id , SEL, id))imp)(window, sel, self.currentScene);
    }
}

- (void)clickUpdateWindow:(UIWindow *)window{
    if ([window isKindOfClass:NSClassFromString(@"UITextEffectsWindow")]) return;
    if (window == nil) return;
    if (_isSceneApp) {
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
        id value = [statusBarManager valueForKeyPath:@"statusBarFrame"];
        CGRect rect;
        [value getValue:&rect];
        return rect;
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
                for (void (^ block)(SSDKScenePackage * _Nonnull) in self.events) {
                    block(self);
                }
                [self.events removeAllObjects];
            }
        }
        _isLoadFirstWindow = isLoadFirstWindow;
    }
}

- (void)addBeforeWindowEvent:(void (^)(SSDKScenePackage * _Nonnull))event{
    if (_isLoadFirstWindow) {
        event(self);
    }else{
        @synchronized (self.events) {
            [self.events addObject:event];
        }
    }
}

- (void)_scene_windowHit{
    Class swizzleClass = objc_getClass("UIWindow");
    if (!swizzleClass) return;
    SEL swizzleSelector = NSSelectorFromString(@"hitTest:withEvent:");
    if (!swizzleSelector) return;
    __block id (* oldImp) (__unsafe_unretained id, SEL,CGPoint, id) = NULL;
    id newImpBlock = ^ (__unsafe_unretained id object,CGPoint obj1,id obj2){
        UIView * obj;
        if ((IMP)oldImp != _objc_msgForward) {
            [[SSDKScenePackage defaultPackage] clickUpdateWindow:object];
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = object,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                obj = ((id (*) (struct objc_super *, SEL, CGPoint, id))objc_msgSendSuper)(&supperInfo, swizzleSelector,obj1,obj2);
            }else{
                obj = oldImp(object,swizzleSelector,obj1,obj2);
            }
        }
        return obj;
    };
    oldImp = (__typeof__ (oldImp))[self methodImpSet:newImpBlock class:swizzleClass selector:swizzleSelector];
}

- (void)_scene_init{
    Class swizzleClass = objc_getClass("UIWindowScene");
    if (!swizzleClass) return;
    SEL swizzleSelector = NSSelectorFromString(@"initWithSession:connectionOptions:");
    if (!swizzleSelector) return;
    __block id (* oldImp) (__unsafe_unretained id, SEL, id,id) = NULL;
    id newImpBlock = ^ (__unsafe_unretained id object, id obj1,id obj2){
        id obj;
        if ((IMP)oldImp != _objc_msgForward) {
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = object,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                obj = ((id (*) (struct objc_super *, SEL,id,id))objc_msgSendSuper)(&supperInfo, swizzleSelector,obj1,obj2);
                
            }else{
                obj = oldImp(object,swizzleSelector,obj1,obj2);
            }
            [[SSDKScenePackage defaultPackage] setScene:obj];
        }
        return obj;
        
    };
    
    oldImp = (__typeof__ (oldImp))(__typeof__ (oldImp))[self methodImpSet:newImpBlock class:swizzleClass selector:swizzleSelector];
}

- (void)methodSwizzledScene{
    @synchronized (self) {
        if (_isSceneApp && _hookSceneStatus == SSDKScenePackageSceneHookStatusNeed) {
            [self _scene_init];
            [self _scene_setDelegate];
            _hookSceneStatus = SSDKScenePackageSceneHookStatusDone;
        }
    }
}

- (void)_scene_setDelegate{
    Class swizzleClass = objc_getClass("UIWindowScene");
    if (!swizzleClass) return;
    SEL swizzleSelector = NSSelectorFromString(@"setDelegate:");
    if (!swizzleSelector) return;
    __block void (* oldImp) (__unsafe_unretained id, SEL,id) = NULL;
    id newImpBlock = ^ (__unsafe_unretained id object, id obj1){
        if ((IMP)oldImp != _objc_msgForward) {
            [[SSDKScenePackage defaultPackage] setSceneDelegate:obj1];
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = object,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL, id))objc_msgSendSuper)(&supperInfo, swizzleSelector,obj1);
            }else{
                oldImp(object,swizzleSelector,obj1);
            }
        }
    };
    
    oldImp = (__typeof__ (oldImp))[self methodImpSet:newImpBlock class:swizzleClass selector:swizzleSelector];
}

- (void)setScene:(id)scene{
    if (!scene) return;
    if ([scene respondsToSelector:sel_registerName("delegate")]) {
        id delegate = ((id (*)(id, SEL))objc_msgSend)(scene,sel_registerName("delegate"));
        [self setSceneDelegate:delegate];
    }
}
- (void)setSceneDelegate:(id)delegate{
    if (!delegate) return;
    @synchronized (self.hookDelegateClassNames) {
        NSString *clasName = NSStringFromClass([delegate class]);
        if ([self.hookDelegateClassNames containsObject:clasName]) return;
        [self hookSceneDelegate:delegate];
        [self.hookDelegateClassNames addObject:clasName];
    }
}
- (void)hookSceneDelegate:(id)delegate{
    [self _scene_willConnectToSession:delegate];
}
- (void)_scene_willConnectToSession:(id)delegate{
    Class swizzleClass = [delegate class];
    if (!swizzleClass) return;
    SEL swizzleSelector = NSSelectorFromString(@"scene:willConnectToSession:options:");
    if (!swizzleSelector) return;
    __block void (* oldImp) (__unsafe_unretained id, SEL,id,id,id) = NULL;
    id newImpBlock = ^ (__unsafe_unretained id object,id obj1,id obj2,id obj3){
        if ((IMP)oldImp != _objc_msgForward) {
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = object,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL,id,id,id))objc_msgSendSuper)(&supperInfo, swizzleSelector,obj1,obj2,obj3);
            }else{
                oldImp(object,swizzleSelector,obj1,obj2,obj3);
            }
        }
        [[SSDKScenePackage defaultPackage] setIsLoadFirstWindow:YES];
    };
    
    oldImp = (__typeof__ (oldImp))[self methodImpSet:newImpBlock class:swizzleClass selector:swizzleSelector];
}

- (IMP)methodImpSet:(dispatch_block_t)newImpBlock class:(Class)class selector:(SEL)selector{
    
    IMP newImp = imp_implementationWithBlock(newImpBlock);
    Method method = class_getInstanceMethod(class, selector);
    IMP imp = method== NULL?_objc_msgForward:NULL;
    if (!class_addMethod(class, selector, newImp, method_getTypeEncoding(method))) {
        imp = method_setImplementation(method, newImp);
    }
    return imp;
}

- (void)_checkApplicationIsSceneApp:(id)delegate{
    @synchronized (self) {
        if (_hookSceneStatus == SSDKScenePackageSceneHookStatusUnstart) {
            if ([delegate respondsToSelector:sel_registerName("application:configurationForConnectingSceneSession:options:")]) {
                _isSceneApp = YES;
                _hookSceneStatus = SSDKScenePackageSceneHookStatusNeed;
                [self methodSwizzledScene];
                
            }else{
                self.isLoadFirstWindow = YES;
            }
        }
    }
}
- (void)_application_setDelegate{
    Class swizzleClass = objc_getClass("UIApplication");
    if (!swizzleClass) return;
    SEL swizzleSelector = NSSelectorFromString(@"setDelegate:");
    if (!swizzleSelector) return;
    __block void (* oldImp) (__unsafe_unretained id, SEL,id) = NULL;
    id newImpBlock = ^ (__unsafe_unretained id object, id obj1){
        [[SSDKScenePackage defaultPackage] _checkApplicationIsSceneApp:obj1];
        if ((IMP)oldImp != _objc_msgForward) {
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = object,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL, id))objc_msgSendSuper)(&supperInfo, swizzleSelector,obj1);
            }else{
                oldImp(object,swizzleSelector,obj1);
            }
        }
    };
    
    oldImp = (__typeof__ (oldImp))[self methodImpSet:newImpBlock class:swizzleClass selector:swizzleSelector];
}


- (void)methodSwizzledApplication{
    [self _application_setDelegate];
    [self _scene_windowHit];
}
@end

__attribute__((constructor)) static void SSDKScenePackageExcImp(){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[SSDKScenePackage defaultPackage] methodSwizzledScene];
        [[SSDKScenePackage defaultPackage] methodSwizzledApplication];
    });
}


@interface SSDKScenePackageRootViewController : UIViewController

@end

@implementation SSDKScenePackageRootViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

@end

typedef NS_ENUM(NSUInteger, SSDKControllerShowStyle) {
    SSDKControllerShowStylePresent = 0,//模态推出
    SSDKControllerShowStylePush//push
};
static void * kSSDKScenePackageShowTypeKey = &kSSDKScenePackageShowTypeKey;
static void * kSSDKScenePackageShowStyleKey = &kSSDKScenePackageShowStyleKey;
static void * kSSDKScenePackageShowDismissTimeKey = &kSSDKScenePackageShowDismissTimeKey;
static void * kSSDKScenePackageShowAnimatedKey = &kSSDKScenePackageShowAnimatedKey;
static void * kSSDKScenePackageShowDismissKey = &kSSDKScenePackageShowDismissKey;
static void * kSSDKScenePackageShowNavigationBarKey = &kSSDKScenePackageShowNavigationBarKey;
static void * kSSDKScenePackageReturnNavigationControllerKey = &kSSDKScenePackageReturnNavigationControllerKey;

@implementation UIViewController (SSDKScenePackage)

- (void)__SSDK_showViewController{
    dispatch_async(dispatch_get_main_queue(), ^{
        id showType = objc_getAssociatedObject(self, kSSDKScenePackageShowTypeKey);
        if (showType && [showType integerValue] != SSDKControllerShowTypeWindow) {
            [self __SSDK_showInRootController];
        }else{
            [self __SSDK_showInNewWindow];
        }
    });
}


- (void)__SSDK_showInNewWindow{
    
    NSInteger showStyle = [objc_getAssociatedObject(self, kSSDKScenePackageShowStyleKey) integerValue];
    BOOL showAnimated = [self _ssdk_AssociatedViewControllerboolValue:kSSDKScenePackageShowAnimatedKey default:showStyle == SSDKControllerShowStylePush];
    BOOL dismissAnimated = [self _ssdk_AssociatedViewControllerboolValue:kSSDKScenePackageShowDismissKey default:showStyle == SSDKControllerShowStylePush];
    NSTimeInterval time = [objc_getAssociatedObject(self, kSSDKScenePackageShowDismissTimeKey) doubleValue];
    UIWindow *currentWindow = [SSDKScenePackage defaultPackage].window;
    [currentWindow endEditing:YES];
    UIWindow *window = [[UIWindow alloc] initWithFrame:currentWindow.bounds];
    window.windowLevel = currentWindow.windowLevel+1;
    [[SSDKScenePackage defaultPackage] showWindow:window];
    SSDKScenePackageRootViewController *root = [[SSDKScenePackageRootViewController alloc] init];
    [root.ssdk_once(YES) addViewDidLoadBlock:^(UIViewController * _Nonnull vc) {
        if (vc.navigationController) {
            [self _ssdk_dealNaviagtionReturnBlock:vc.navigationController];
        }
        objc_setAssociatedObject(self, kSSDKScenePackageReturnNavigationControllerKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
    if (showStyle == SSDKControllerShowStylePush) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
        window.rootViewController = nav;
        nav.interactivePopGestureRecognizer.delegate = (id <UIGestureRecognizerDelegate>)nav;
        nav.navigationBarHidden = YES;
    }else{
        window.rootViewController = root;
    }
    window.hidden = NO;
    [window makeKeyWindow];
    window.backgroundColor = [UIColor clearColor];
    
    [[SSDKScenePackage defaultPackage].alertWindows addObject:window];
    if (showStyle == SSDKControllerShowStylePush) {
        id isBarHidden = objc_getAssociatedObject(self, kSSDKScenePackageShowNavigationBarKey);
        BOOL defaultNavigationBarHidden = YES;
        BOOL barHidden = YES;
        if (!isBarHidden) {
            UIViewController *topViewController = [self _ssdk_getTopViewController:currentWindow.rootViewController];
            UINavigationController *currentTopNavi = [self __ssdk_getNavigationControllerWithVC:topViewController];
            YES;
            if (currentTopNavi) {
                defaultNavigationBarHidden = currentTopNavi.navigationBar.isHidden;
            }
            barHidden = defaultNavigationBarHidden;
            root.title = topViewController.title?:topViewController.navigationItem.title;
        }else{
            barHidden = [isBarHidden boolValue];
        }
        [self addViewWillDisappearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
            vc.navigationController.navigationBarHidden = defaultNavigationBarHidden;
        }];
        [self addViewWillAppearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
            vc.navigationController.navigationBarHidden = barHidden;
        }];
        
        [root.ssdk_once(YES) addViewDidAppearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
            [vc.navigationController pushViewController:self animated:showAnimated];
            
        }];
        if (time > 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:dismissAnimated];
            });
        }
    }else{
        [root.ssdk_once(YES) addViewDidAppearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
            [vc presentViewController:self animated:showAnimated completion:nil];
        }];
        if (time > 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:dismissAnimated completion:nil];
            });
        }
    }
    
    __weak typeof(window)weakWindow = window;
    [self addDeallocTask:^(id  _Nonnull object) {
        __strong typeof(weakWindow) strongWindow = weakWindow;
        if (!strongWindow) return;
        [strongWindow resignKeyWindow];
        [[SSDKScenePackage defaultPackage].alertWindows removeObject:strongWindow];
        [strongWindow removeFromSuperview];
        strongWindow.hidden = YES;
    }];
}

- (void)__SSDK_showInRootController{
    
    UIViewController *viewController = ([SSDKScenePackage defaultPackage].keyWindow?:[SSDKScenePackage defaultPackage].window).rootViewController;
    UIViewController *vc = [self _ssdk_getTopViewController:viewController];
    if (vc) {
        NSInteger showStyle = [objc_getAssociatedObject(self, kSSDKScenePackageShowStyleKey) integerValue];
        BOOL showAnimated = [self _ssdk_AssociatedViewControllerboolValue:kSSDKScenePackageShowAnimatedKey default:showStyle == SSDKControllerShowStylePush];
        BOOL dismissAnimated = [self _ssdk_AssociatedViewControllerboolValue:kSSDKScenePackageShowDismissKey default:showStyle == SSDKControllerShowStylePush];
        NSTimeInterval time = [objc_getAssociatedObject(self, kSSDKScenePackageShowDismissTimeKey) doubleValue];
        if (showStyle == SSDKControllerShowStylePush) {
            UINavigationController *nav = [self __ssdk_getNavigationControllerWithVC:vc];
            [nav pushViewController:self animated:showAnimated];
            if (time > 0) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController popViewControllerAnimated:dismissAnimated];
                });
            }
        }else{
            SSDKControllerShowType showType = [objc_getAssociatedObject(self, kSSDKScenePackageShowTypeKey) integerValue];
            if (showType == SSDKControllerShowTypeRootVC) {
                [viewController presentViewController:self animated:showAnimated completion:nil];
            }else if (showType == SSDKControllerShowTypeNavigationVC){
                UINavigationController *nav = [self __ssdk_getNavigationControllerWithVC:vc];
                [nav presentViewController:self animated:showAnimated completion:nil];
            }else{
                [vc presentViewController:self animated:showAnimated completion:nil];
            }
            if (time > 0) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated:dismissAnimated completion:nil];
                });
            }
        }
    }
    
}

- (BOOL)_ssdk_AssociatedViewControllerboolValue:(void *)key default:(BOOL)booValue{
    id value = objc_getAssociatedObject(self, key);
    if (value) {
        return [value boolValue];
    }else{
        return booValue;
    }
    
}

- (void)_ssdk_dealNaviagtionReturnBlock:(UINavigationController *)nav{
    void (^block) (UINavigationController *nav) = objc_getAssociatedObject(self, kSSDKScenePackageReturnNavigationControllerKey);
    if (block) {
        block(nav);
    }
}

- (UIViewController *)_ssdk_getTopViewController:(UIViewController *)viewController{
    UIViewController *vc = viewController;
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

- (UINavigationController *)__ssdk_getNavigationControllerWithVC:(UIViewController *)vc{
    UIResponder * responder = vc.view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return (UINavigationController *)responder;
}

- (UIViewController * _Nonnull (^)(SSDKControllerShowType))showType{
    return ^(SSDKControllerShowType type){
        objc_setAssociatedObject(self, kSSDKScenePackageShowTypeKey, @(type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}


- (UIViewController * _Nonnull (^)(BOOL))showAnimated{
    return ^(BOOL isAnimated){
        objc_setAssociatedObject(self, kSSDKScenePackageShowAnimatedKey, @(isAnimated), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIViewController * _Nonnull (^)(NSTimeInterval))dismissTime{
    return ^(NSTimeInterval time){
        objc_setAssociatedObject(self, kSSDKScenePackageShowDismissTimeKey, @(time), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIViewController * _Nonnull (^)(BOOL))dismissAnimated{
    return ^ (BOOL isAnimated){
        objc_setAssociatedObject(self, kSSDKScenePackageShowDismissKey, @(isAnimated), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIViewController * _Nonnull (^)(void))present{
    return ^{
        if ([self _ssdk_isShowing]) return self;
        objc_setAssociatedObject(self, kSSDKScenePackageShowStyleKey, @(SSDKControllerShowStylePresent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self __SSDK_showViewController];
        return self;
    };
}

- (UIViewController * _Nonnull (^)(void))push{
    return ^{
        if ([self _ssdk_isShowing]) return self;
        objc_setAssociatedObject(self, kSSDKScenePackageShowStyleKey, @(SSDKControllerShowStylePush), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self __SSDK_showViewController];
        return self;
    };
}

- (BOOL)_ssdk_isShowing{
    if( objc_getAssociatedObject(self, @selector(__SSDK_showViewController)))return YES;
    objc_setAssociatedObject(self, @selector(__SSDK_showViewController), @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.ssdk_once(YES) addViewDidAppearBlock:^(UIViewController * _Nonnull vc, BOOL animated) {
        objc_setAssociatedObject(vc, @selector(__SSDK_showViewController), nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
    return NO;
}

- (UIViewController * _Nonnull (^)(BOOL))navigationBarHidden{
    return ^(BOOL navigationbarHidden){
        objc_setAssociatedObject(self, kSSDKScenePackageShowNavigationBarKey, @(navigationbarHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (UIViewController * _Nonnull (^)(void (^ _Nonnull)(UINavigationController * _Nonnull)))pushWithNavigation{
    return ^ (void (^navigationContoller) (UINavigationController *nav)){
        objc_setAssociatedObject(self, kSSDKScenePackageReturnNavigationControllerKey, navigationContoller, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self.push();
    };
}

@end



static void *kSSDKScenePackageViewLifeEventTasksKey = &kSSDKScenePackageViewLifeEventTasksKey;
static void *kSSDKScenePackageViewLifeEventFlagTag = &kSSDKScenePackageViewLifeEventFlagTag;
static void *kSSDKScenePackageViewLifeEventOnceKey = &kSSDKScenePackageViewLifeEventOnceKey;
static inline void SSDKScenePackageViewLifeEventSwizzledMethodExp(Class swizzleClass, NSString *sel){
    @synchronized (swizzleClass) {
        NSMutableArray *sels = objc_getAssociatedObject(swizzleClass, kSSDKScenePackageViewLifeEventFlagTag);
        if (!sels) {
            sels = [NSMutableArray array];
            objc_setAssociatedObject(swizzleClass, kSSDKScenePackageViewLifeEventFlagTag, sels, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        if ([sels containsObject:sel]) return;
        [sels addObject: sel];
        SEL selector = NSSelectorFromString(sel);
        __block void (* oldImp) (__unsafe_unretained id, SEL,BOOL) = NULL;
        id newImpBlock = ^ (__unsafe_unretained id self,BOOL animated){
            NSMutableDictionary *taskMap = objc_getAssociatedObject(self, kSSDKScenePackageViewLifeEventTasksKey);
            NSMutableArray *tasks = [taskMap objectForKey:sel];
            NSArray * untableTasks = tasks.copy;
            @synchronized (untableTasks) {
                if (untableTasks.count > 0) {
                    [untableTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([objc_getAssociatedObject(obj, kSSDKScenePackageViewLifeEventOnceKey) boolValue]) {
                            [tasks removeObject:obj];
                        }
                        
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (obj) {
                                ((void (^) (id,BOOL))obj)(self,animated);
                            }
                        });
                        
                    }];
                }
            }
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL,BOOL))objc_msgSendSuper)(&supperInfo, selector, animated);
            }else{
                oldImp(self,selector,animated);
            }
        };
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        Method method = class_getInstanceMethod(swizzleClass, selector);
        if (!class_addMethod(swizzleClass, selector, newImp, method_getTypeEncoding(method))) {
            oldImp = (__typeof__ (oldImp))method_getImplementation(method);
            oldImp = (__typeof__ (oldImp))method_setImplementation(method, newImp);
        }
    }
}

static inline void SSDKScenePackageViewLifeEventSwizzledNoParametersMethodExp(Class swizzleClass, NSString *sel){
    @synchronized (swizzleClass) {
        NSMutableArray *sels = objc_getAssociatedObject(swizzleClass, kSSDKScenePackageViewLifeEventFlagTag);
        if (!sels) {
            sels = [NSMutableArray array];
            objc_setAssociatedObject(swizzleClass, kSSDKScenePackageViewLifeEventFlagTag, sels, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        if ([sels containsObject:sel]) return;
        [sels addObject: sel];
        SEL selector = NSSelectorFromString(sel);
        __block void (* oldImp) (__unsafe_unretained id, SEL) = NULL;
        id newImpBlock = ^ (__unsafe_unretained id self){
            NSMutableDictionary *taskMap = objc_getAssociatedObject(self, kSSDKScenePackageViewLifeEventTasksKey);
            NSMutableArray *tasks = [taskMap objectForKey:sel];
            NSArray * untableTasks = tasks.copy;
            @synchronized (untableTasks) {
                if (untableTasks.count > 0) {
                    [untableTasks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([objc_getAssociatedObject(obj, kSSDKScenePackageViewLifeEventOnceKey) boolValue]) {
                            [tasks removeObject:obj];
                        }
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (obj) {
                                ((void (^) (id))obj)(self);
                            }
                        });
                        
                        
                    }];
                }
            }
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL))objc_msgSendSuper)(&supperInfo, selector);
            }else{
                oldImp(self,selector);
            }
        };
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        Method method = class_getInstanceMethod(swizzleClass, selector);
        if (!class_addMethod(swizzleClass, selector, newImp, method_getTypeEncoding(method))) {
            oldImp = (__typeof__ (oldImp))method_getImplementation(method);
            oldImp = (__typeof__ (oldImp))method_setImplementation(method, newImp);
        }
    }
}

@implementation UIViewController (SSDKScenePackageLifeEvents)

- (void)_ssdk_viewLifeEventTasks:(NSString *)key block:(id)block{
    NSMutableDictionary * tasksMap = objc_getAssociatedObject(self, kSSDKScenePackageViewLifeEventTasksKey);
    NSMutableArray *tasks;
    if (tasksMap) {
        tasks = tasksMap[key];
    }else{
        tasksMap = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, kSSDKScenePackageViewLifeEventTasksKey, tasksMap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    @synchronized (tasksMap) {
        if (!tasks) {
            tasks = [NSMutableArray array];
            tasksMap[key] = tasks;
        }
        if (![key hasSuffix:@":"]) {
            SSDKScenePackageViewLifeEventSwizzledNoParametersMethodExp(object_getClass(self),key);
        }else{
            SSDKScenePackageViewLifeEventSwizzledMethodExp(object_getClass(self),key);
        }
        
        [tasks addObject:[block copy]];
        objc_setAssociatedObject(tasks.lastObject, kSSDKScenePackageViewLifeEventOnceKey, objc_getAssociatedObject(self, kSSDKScenePackageViewLifeEventOnceKey), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, kSSDKScenePackageViewLifeEventOnceKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)addViewWillAppearBlock:(void (^) (UIViewController * vc, BOOL animated))block{
    [self _ssdk_viewLifeEventTasks:@"viewWillAppear:" block:block];
}

- (void)addViewDidLoadBlock:(void (^)(UIViewController * _Nonnull))block{
    [self _ssdk_viewLifeEventTasks:@"viewDidLoad" block:block];
}

- (void)addViewDidAppearBlock:(void (^) (UIViewController * vc, BOOL animated))block{
    [self _ssdk_viewLifeEventTasks:@"viewDidAppear:" block:block];
}

- (void)addViewWillDisappearBlock:(void (^) (UIViewController * vc, BOOL animated))block{
    [self _ssdk_viewLifeEventTasks:@"viewWillDisappear:" block:block];
}

- (void)addViewDidDisappearBlock:(void (^) (UIViewController * vc, BOOL animated))block{
    [self _ssdk_viewLifeEventTasks:@"viewDidDisappear:" block:block];
}

- (void)addLoadViewBlock:(void (^)(UIViewController * _Nonnull))block{
    [self _ssdk_viewLifeEventTasks:@"loadView" block:block];
}

- (UIViewController * _Nonnull (^)(BOOL))ssdk_once{
    return ^ (BOOL once){
        objc_setAssociatedObject(self, kSSDKScenePackageViewLifeEventOnceKey, @(once), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}
@end


