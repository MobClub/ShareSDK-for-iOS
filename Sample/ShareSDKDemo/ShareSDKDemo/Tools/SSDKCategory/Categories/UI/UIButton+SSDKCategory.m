//
//  UIButton+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 SSDK. All rights reserved.
//

#import "UIButton+SSDKCategory.h"
#import <objc/message.h>
#import <time.h>

static const void *SSDKButtonRuntimeLimitTasks         = &SSDKButtonRuntimeLimitTasks;
static const void *SSDKButtonRuntimeLimitTapBlock      = &SSDKButtonRuntimeLimitTapBlock;
static const void *SSDKButtonRuntimeLimitTapTimes      = &SSDKButtonRuntimeLimitTapTimes;
static const void *SSDKButtonRuntimeLimitTapLastTimes  = &SSDKButtonRuntimeLimitTapLastTimes;
static const void *SSDKButtonRuntimeLimitTapSpaceTimes = &SSDKButtonRuntimeLimitTapSpaceTimes;
static const void *SSDKButtonRuntimeLimitIsStop        = &SSDKButtonRuntimeLimitIsStop;

static NSString *UI_swizzleButtonMethodName = @"SSDK_UI_swizzleButtonLimitTimeMethod";

static inline void UI_swizzleButtonIfNeed(Class swizzleClass){
    @synchronized (swizzleClass) {
        if (class_getMethodImplementation(swizzleClass, NSSelectorFromString(UI_swizzleButtonMethodName)) !=_objc_msgForward) return;
        class_addMethod(swizzleClass, NSSelectorFromString(UI_swizzleButtonMethodName), imp_implementationWithBlock(^(id object,SEL sel){}), "v@:");
        SEL buttonTapSelector = sel_registerName("_sendActionsForEvents:withEvent:");
        __block void (* oldImp) (__unsafe_unretained id, SEL,UIControlEvents,id) = NULL;
        id newImpBlock = ^ (__unsafe_unretained UIButton* self,UIControlEvents events, id a){
            if (events & UIControlEventTouchUpInside) {
                if (objc_getAssociatedObject(self, SSDKButtonRuntimeLimitIsStop)) return;
                id spaceTime = objc_getAssociatedObject(self, SSDKButtonRuntimeLimitTapSpaceTimes);
                if (spaceTime) {
                   NSTimeInterval spaceTimef = [spaceTime doubleValue];
                    id lastTime = objc_getAssociatedObject(self, SSDKButtonRuntimeLimitTapLastTimes);
                    NSTimeInterval currentTime = time(NULL);
                    if (lastTime) {
                        if (currentTime - [lastTime doubleValue] < spaceTimef) return;
                    }
                    objc_setAssociatedObject(self, SSDKButtonRuntimeLimitTapLastTimes, @(currentTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                SSDKButtonLimitTimesTapBlock block = objc_getAssociatedObject(self, SSDKButtonRuntimeLimitTapBlock);
                if (block) {
                    NSUInteger tapTimes = [objc_getAssociatedObject(self, SSDKButtonRuntimeLimitTapTimes) integerValue];
                    tapTimes ++;
                    objc_setAssociatedObject(self, SSDKButtonRuntimeLimitTapTimes, @(tapTimes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                    BOOL stop = NO;
                    block(tapTimes,&stop,self);
                    if (stop) {
                        objc_setAssociatedObject(self, SSDKButtonRuntimeLimitIsStop, @(stop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
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

@implementation UIButton (SSDKCategory)

- (void)imageDirection:(SSDKButtonImageDirection)direction space:(CGFloat)space{
    CGFloat imageWidth, imageHeight, textWidth, textHeight, x, y;
    imageWidth = self.currentImage.size.width;
    imageHeight = self.currentImage.size.height;
    [self.titleLabel sizeToFit];
    textWidth = self.titleLabel.frame.size.width;
    textHeight = self.titleLabel.frame.size.height;
    space = space / 2;
    switch (direction) {
        case SSDKButtonImageDirectionTop:{
            x = textHeight / 2 + space;
            y = textWidth / 2;
            self.imageEdgeInsets = UIEdgeInsetsMake(-x, y, x, - y);
            x = imageHeight / 2 + space;
            y = imageWidth / 2;
            self.titleEdgeInsets = UIEdgeInsetsMake(x, - y, - x, y);
        }
            break;
        case SSDKButtonImageDirectionBottom:{
            x = textHeight / 2 + space;
            y = textWidth / 2;
            self.imageEdgeInsets = UIEdgeInsetsMake(x, y, -x, - y);
            x = imageHeight / 2 + space;
            y = imageWidth / 2;
            self.titleEdgeInsets = UIEdgeInsetsMake(-x, - y, x, y);
        }
            break;
        case SSDKButtonImageDirectionLeft:{
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space,0, space);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space , 0, - space);
        }
            break;
        case SSDKButtonImageDirectionRight:{
            self.imageEdgeInsets = UIEdgeInsetsMake(0, space + textWidth, 0, - (space + textWidth));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(space + imageWidth), 0, (space + imageWidth));
        }
            break;
        default:
            break;
    }
}


- (UIButton * _Nonnull (^)(SSDKButtonLimitTimesTapBlock _Nonnull))buttonTapTime{
    return ^(SSDKButtonLimitTimesTapBlock block){
        if (block != nil) {
            UI_swizzleButtonIfNeed(object_getClass(self));
        }
        objc_setAssociatedObject(self, SSDKButtonRuntimeLimitTapBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSTimeInterval))tapSpaceTime{
    return ^(NSTimeInterval time){
        UI_swizzleButtonIfNeed(object_getClass(self));
        objc_setAssociatedObject(self, SSDKButtonRuntimeLimitTapSpaceTimes, @(time), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return self;
    };
}

- (void)cancelRecordTime{
    if (!objc_getAssociatedObject(self, SSDKButtonRuntimeLimitTapLastTimes)) return;
    objc_setAssociatedObject(self, SSDKButtonRuntimeLimitTapLastTimes, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
