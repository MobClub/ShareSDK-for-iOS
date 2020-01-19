//
//  SSDKBaseGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"
#import "UIGestureRecognizer+SSDKCategory.h"

#define SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, id, UIGestureRecognizer)

@implementation SSDKBaseGestureChainModel

- (instancetype)initWithGesture:(UIGestureRecognizer *)gesture{
    if (self = [super init]) {
        _gesture = gesture;
        _gestureClass = [gesture class];
    }
    return self;
}

SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(delegate, id<UIGestureRecognizerDelegate>)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(enabled, BOOL)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(cancelsTouchesInView, BOOL)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(delaysTouchesBegan, BOOL)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(delaysTouchesEnded, BOOL)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(requiresExclusiveTouchType, BOOL)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(allowedTouchTypes, NSArray<NSNumber *> *)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(allowedPressTypes, NSArray<NSNumber *> *)
SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION(name, NSString *)

- (id  _Nonnull (^)(UIGestureRecognizer * _Nonnull))requireGestureRecognizerToFail{
    return ^ (UIGestureRecognizer *gesture){
        if (gesture) {
            [self.gesture requireGestureRecognizerToFail:gesture];
        }
        return self;
    };
}

- (id  _Nonnull (^)(id _Nonnull, SEL _Nonnull))addTarget{
    return ^ (id target, SEL action){
        if (target && action) {
            [self.gesture addTarget:target action:action];
        }
        return self;
    };
}

- (id  _Nonnull (^)(id _Nonnull, SEL _Nonnull))removeTarget{
    return ^ (id target, SEL action){
        if (target) {
            [self.gesture removeTarget:target action:action];
        }
        return self;
    };
}

- (id  _Nonnull (^)(void (^ _Nonnull)(id _Nonnull)))addTargetBlock{
    return ^ (GestureTargetAction action){
        if (action) {
            [self.gesture addTargetBlock:action];
        }
        return self;
    };
}

- (id  _Nonnull (^)(void (^ _Nonnull)(id _Nonnull), NSString * _Nonnull))addTargetBlockWithTag{
    return ^ (GestureTargetAction action, NSString *tag){
        if (action) {
            [self.gesture addTargetBlock:action tag:tag];
        }
        return self;
    };
}

- (id  _Nonnull (^)(NSString * _Nonnull))removeTargetBlockWithTag{
    return ^ (NSString *tag){
        if (tag) {
            [self.gesture removeTargetBlockByTag:tag];
            
        }
        return self;
    };
}

- (id  _Nonnull (^)(void))removeAllTargetBlock{
    return ^(){
        [self.gesture removeAllTargetBlock];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull))addToSuperView{
    return ^ (UIView *superView){
        if (superView) {
            [superView addGestureRecognizer:self.gesture];
        }
        return self;
    };
}

@end
#undef SSDKCATEGORY_CHAIN_GESTURE_IMPLEMENTATION
