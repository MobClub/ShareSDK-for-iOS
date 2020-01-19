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

@end
@implementation UIViewController (SSDKScenePackage)

- (void)showInNewWindowAndDissmissAfterTime:(NSTimeInterval)time{
    [self showInNewWindow];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:NO completion:nil];
    });
}

- (void)showInNewWindow{
    [self showInNewWindow:NO];
}

- (void)showInNewWindow:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *currentWindow = [SSDKScenePackage defaultPackage].window;
        [currentWindow endEditing:YES];
        UIWindow *window = [[UIWindow alloc] initWithFrame:currentWindow.bounds];
        window.windowLevel = currentWindow.windowLevel+1;
        [[SSDKScenePackage defaultPackage] showWindow:window];
        UIViewController *root = [[SSDKScenePackageRootViewController alloc] init];
        root.view.backgroundColor = [UIColor clearColor];
        window.rootViewController = root;
        window.hidden = NO;
        [window makeKeyWindow];
        [root presentViewController:self animated:animated completion:nil];
        window.backgroundColor = [UIColor clearColor];
        [[SSDKScenePackage defaultPackage].alertWindows addObject:window];
        __weak typeof(window)weakWindow = window;
        [self addDeallocTask:^(id  _Nonnull object) {
            __strong typeof(weakWindow) strongWindow = weakWindow;
            if (!strongWindow) return;
            [strongWindow resignKeyWindow];
            [[SSDKScenePackage defaultPackage].alertWindows removeObject:strongWindow];
            [strongWindow removeFromSuperview];
            strongWindow.hidden = YES;
        }];
    });
}


- (UIViewController * _Nullable (^)(void))show{
    return ^()
    {
         
        [self showInNewWindow];
        return self;
    };
}

- (UIViewController * _Nullable (^)(BOOL))showAnimated{
    
    return ^(BOOL animated)
    {
        [self showInNewWindow:animated];
        return self;
    };
}

@end
