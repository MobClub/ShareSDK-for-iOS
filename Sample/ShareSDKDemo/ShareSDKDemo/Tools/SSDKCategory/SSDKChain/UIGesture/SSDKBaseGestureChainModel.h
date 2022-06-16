//
//  SSDKBaseGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKChainBaseModel.h"

#define SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass) SSDKCATEGORY_CHAIN_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKModelType, SSDKPropertyClass)

#define SSDKCATEGORY_GESTURE_IMPLEMENTATION(SSDKClass, modelType)\
@implementation SSDKClass (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithGesture:self modelClass:[SSDKClass class]];\
}\
@end
NS_ASSUME_NONNULL_BEGIN



@interface SSDKBaseGestureChainModel <__covariant  ObjectType> : SSDKChainBaseModel<ObjectType>

- (instancetype)initWithGesture:(UIGestureRecognizer *)gesture modelClass:(Class)modelClass;

@property (nonatomic, strong, readonly) __kindof UIGestureRecognizer * gesture;

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id<UIGestureRecognizerDelegate> delegate);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ enabled) (BOOL enabled);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ cancelsTouchesInView) (BOOL cancelsTouchesInView);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ delaysTouchesBegan) (BOOL delaysTouchesBegan);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ delaysTouchesEnded) (BOOL delaysTouchesEnded);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ allowedTouchTypes) (NSArray<NSNumber *> *allowedTouchTypes) API_AVAILABLE(ios(9));

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ allowedPressTypes) (NSArray<NSNumber *> *allowedPressTypes) API_AVAILABLE(ios(9));

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ requiresExclusiveTouchType) (BOOL requiresExclusiveTouchType)API_AVAILABLE(ios(9.2));

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ name) (NSString * name) API_AVAILABLE(ios(11));

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ requireGestureRecognizerToFail) (UIGestureRecognizer * requireGestureRecognizerToFail);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget) (id target, SEL action);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id target, SEL action);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock) (void (^) (id gesture));

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlockWithTag) (void (^) (id gesture), NSString *tag);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTargetBlockWithTag) (NSString *tag);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(void);

SSDKCATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *view);

@end

NS_ASSUME_NONNULL_END
