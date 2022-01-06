//
//  SSDKScrollLayerChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKScrollLayerChainModel.h"
#define SSDKCATEGORY_CHAIN_SCROLLLAYER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKScrollLayerChainModel *, CAScrollLayer)

@implementation SSDKScrollLayerChainModel
SSDKCATEGORY_CHAIN_SCROLLLAYER_IMPLEMENTATION(scrollMode, CAScrollLayerScrollMode)

- (SSDKScrollLayerChainModel * _Nonnull (^)(CGRect))scrollToRect{
    return ^ (CGRect rect){
        [self enumerateObjectsUsingBlock:^(CAScrollLayer * _Nonnull obj) {
            [obj scrollToRect:rect];
        }];
        return self;
    };
}

- (SSDKScrollLayerChainModel * _Nonnull (^)(CGPoint))scrollToPoint{
    return ^ (CGPoint point){
        [self enumerateObjectsUsingBlock:^(CAScrollLayer * _Nonnull obj) {       
            [obj scrollToPoint:point];
        }];
        return self;
    };
}

@end
SSDKCATEGORY_LAYER_IMPLEMENTATION(CAScrollLayer, SSDKScrollLayerChainModel)
#undef SSDKCATEGORY_CHAIN_SCROLLLAYER_IMPLEMENTATION
