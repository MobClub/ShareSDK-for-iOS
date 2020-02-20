//
//  SSDKPanGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKPanGestureChainModel.h"
#define SSDKCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKPanGestureChainModel *, UIPanGestureRecognizer)
@implementation SSDKPanGestureChainModel
SSDKCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION(minimumNumberOfTouches, NSUInteger)
SSDKCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION(maximumNumberOfTouches, NSUInteger)

- (SSDKPanGestureChainModel * _Nonnull (^)(CGPoint, UIView * _Nonnull))translation{
    return ^ (CGPoint translation, UIView *view){
        [self enumerateObjectsUsingBlock:^(UIPanGestureRecognizer * _Nonnull obj) {
            [obj setTranslation:translation inView:view];
        }];
        return self;
    };
}
@end
SSDKCATEGORY_GESTURE_IMPLEMENTATION(UIPanGestureRecognizer, SSDKPanGestureChainModel)
#undef SSDKCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION
