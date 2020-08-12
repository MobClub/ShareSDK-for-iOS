//
//  UIViewController+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/21.
//  Copyright © 2019 mob. All rights reserved.
//

#import "UIViewController+SSDKCategory.h"
#import <objc/message.h>
static const void *ssdkRuntimeVCDismissKey = &ssdkRuntimeVCDismissKey;

static inline NSMutableSet *ssdkSwizzledVCDismissSet(){
    static NSMutableSet *set = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        set = [NSMutableSet set];
    });
    return set;
}

static inline void ssdk_swizzleDismissIfNeed(Class swizzleClass){
    NSMutableSet *dismissSet = ssdkSwizzledVCDismissSet();
    @synchronized (dismissSet) {
        NSString *className = NSStringFromClass(swizzleClass);
        if ([dismissSet containsObject:className]) return;
        SEL selector = sel_registerName("dismissViewControllerAnimated:completion:");
        __block void (* oldImp) (__unsafe_unretained id, SEL,BOOL,id) = NULL;
        id newImpBlock = ^ (__unsafe_unretained id self, BOOL animated, void (^completion) (void) ){
            __weak typeof(self)weakSelf = self;
            id completeBlock = ^{
                NSMutableArray *dismissTasks = objc_getAssociatedObject(weakSelf, &ssdkRuntimeVCDismissKey);
                @synchronized (dismissTasks) {
                    if (dismissTasks.count > 0) {
                        [dismissTasks enumerateObjectsUsingBlock:^(ssdk_dismissTask obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            if (obj) {
                                obj(weakSelf);
                            }
                        }];
                        [dismissTasks removeAllObjects];
                    }
                }
                if (completion) {
                    completion();
                }
            };
            
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL, BOOL, id))objc_msgSendSuper)(&supperInfo, selector, animated, completeBlock);
            }else{
                oldImp(self,selector, animated, completeBlock);
            }
        };
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        if (!class_addMethod(swizzleClass, selector, newImp, "v@:B@?")) {
            Method dismissMethod = class_getInstanceMethod(swizzleClass, selector);
            oldImp = (__typeof__ (oldImp))method_getImplementation(dismissMethod);
            oldImp = (__typeof__ (oldImp))method_setImplementation(dismissMethod, newImp);
        }
        [dismissSet addObject:className];
    }
}


@implementation UIViewController (SSDKCategory)

- (NSMutableArray<ssdk_dismissTask> *)ssdk_dismissTasks{
    NSMutableArray *tasks = objc_getAssociatedObject(self, &ssdkRuntimeVCDismissKey);
    if (tasks) return tasks;
    tasks = [NSMutableArray array];
    ssdk_swizzleDismissIfNeed(object_getClass(self));
    objc_setAssociatedObject(self, &ssdkRuntimeVCDismissKey, tasks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tasks;
}

- (UIViewController * _Nonnull (^)(ssdk_dismissTask _Nonnull))ssdk_dismissViewControllerAnimated{
    __weak typeof(self)weakSelf = self;
    return ^ (ssdk_dismissTask task){
        @synchronized ([weakSelf ssdk_dismissTasks]) {
            [[weakSelf ssdk_dismissTasks] addObject:task];
        }
        return weakSelf;
    };
}

- (UINavigationController *)ssdk_navigationController{
    UIResponder * responder = self.view.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            break;
        }
        responder = responder.nextResponder;
    }
    return  (UINavigationController *)responder;
}

@end
