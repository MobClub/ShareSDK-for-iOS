//
//  UIButton+LimitTimes.m
//  ShareSDKDemo
//
//  Created by maxl on 2019/10/11.
//  Copyright © 2019 bytedance.co. All rights reserved.
//

#import "UIButton+MOB.h"
#import <objc/message.h>
#import <time.h>
static const void *MOBButtonRuntimeLimitTasks         = &MOBButtonRuntimeLimitTasks;
static const void *MOBButtonRuntimeLimitTapBlock      = &MOBButtonRuntimeLimitTapBlock;
static const void *MOBButtonRuntimeLimitTapTimes      = &MOBButtonRuntimeLimitTapTimes;
static const void *MOBButtonRuntimeLimitTapLastTimes  = &MOBButtonRuntimeLimitTapLastTimes;
static const void *MOBButtonRuntimeLimitTapSpaceTimes = &MOBButtonRuntimeLimitTapSpaceTimes;
static const void *MOBButtonRuntimeLimitIsStop        = &MOBButtonRuntimeLimitIsStop;

static NSString *UI_swizzleButtonMethodName = @"MOB_UI_swizzleButtonLimitTimeMethod";

static inline void UI_swizzleButtonIfNeed(Class swizzleClass){
    @synchronized (swizzleClass) {
        if (class_getMethodImplementation(swizzleClass, NSSelectorFromString(UI_swizzleButtonMethodName)) !=_objc_msgForward) return;
        class_addMethod(swizzleClass, NSSelectorFromString(UI_swizzleButtonMethodName), imp_implementationWithBlock(^(id object,SEL sel){}), "v@:");
        SEL buttonTapSelector = sel_registerName("_sendActionsForEvents:withEvent:");
        __block void (* oldImp) (__unsafe_unretained id, SEL,UIControlEvents,id) = NULL;
        id newImpBlock = ^ (__unsafe_unretained UIButton* self,UIControlEvents events, id a){
            if (events & UIControlEventTouchUpInside) {
                if (objc_getAssociatedObject(self, MOBButtonRuntimeLimitIsStop)) return;
                id spaceTime = objc_getAssociatedObject(self, MOBButtonRuntimeLimitTapSpaceTimes);
                if (spaceTime) {
                   NSTimeInterval spaceTimef = [spaceTime doubleValue];
                    id lastTime = objc_getAssociatedObject(self, MOBButtonRuntimeLimitTapLastTimes);
                    NSTimeInterval currentTime = time(NULL);
                    if (lastTime) {
                        if (currentTime - [lastTime doubleValue] < spaceTimef) return;
                    }
                    objc_setAssociatedObject(self, MOBButtonRuntimeLimitTapLastTimes, @(currentTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                MOBButtonLimitTimesTapBlock block = objc_getAssociatedObject(self, MOBButtonRuntimeLimitTapBlock);
                if (block) {
                    NSUInteger tapTimes = [objc_getAssociatedObject(self, MOBButtonRuntimeLimitTapTimes) integerValue];
                    tapTimes ++;
                    objc_setAssociatedObject(self, MOBButtonRuntimeLimitTapTimes, @(tapTimes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                    BOOL stop = NO;
                    block(tapTimes,&stop,self);
                    if (stop) {
                        objc_setAssociatedObject(self, MOBButtonRuntimeLimitIsStop, @(stop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                        return;
                    }
                }
            }
            if (oldImp == NULL) {
                struct objc_super supperInfo = {
                    .receiver = self,
                    .super_class = class_getSuperclass(swizzleClass)
                };
                ((void (*) (struct objc_super *, SEL,UIControlEvents,id))objc_msgSendSuper)(&supperInfo, buttonTapSelector,events,a);
            }else{
                oldImp(self,buttonTapSelector,events,a);
            }
        };
        Method buttonTapMethod = class_getInstanceMethod(swizzleClass, buttonTapSelector);
        IMP newImp = imp_implementationWithBlock(newImpBlock);
        if (!class_addMethod(swizzleClass, buttonTapSelector, newImp, method_getTypeEncoding(buttonTapMethod))) {
            oldImp = (__typeof__ (oldImp))method_setImplementation(buttonTapMethod, newImp);
        }
    }
}


@implementation UIButton (MOB)

- (UIButton * _Nonnull (^)(MOBButtonLimitTimesTapBlock _Nonnull))buttonTapTime{
    return ^(MOBButtonLimitTimesTapBlock block){
        if (block != nil) {
            UI_swizzleButtonIfNeed(object_getClass(self));
        }
        objc_setAssociatedObject(self, MOBButtonRuntimeLimitTapBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSTimeInterval))tapSpaceTime{
    return ^(NSTimeInterval time){
        UI_swizzleButtonIfNeed(object_getClass(self));
        objc_setAssociatedObject(self, MOBButtonRuntimeLimitTapSpaceTimes, @(time), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (void)cancelRecordTime{
    if (!objc_getAssociatedObject(self, MOBButtonRuntimeLimitTapLastTimes)) return;
    objc_setAssociatedObject(self, MOBButtonRuntimeLimitTapLastTimes, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
