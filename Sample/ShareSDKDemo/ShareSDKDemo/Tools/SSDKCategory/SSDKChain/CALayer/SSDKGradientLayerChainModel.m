//
//  SSDKGradientLayerChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKGradientLayerChainModel.h"
#define SSDKCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKGradientLayerChainModel *, CAGradientLayer)

@implementation SSDKGradientLayerChainModel
SSDKCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(locations, NSArray<NSNumber *> *)
SSDKCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(startPoint, CGPoint)
SSDKCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(endPoint, CGPoint)


- (SSDKGradientLayerChainModel * _Nonnull (^)(NSArray * _Nonnull))colors{
    return ^ (NSArray *colors){
        NSMutableArray *bridgeColors = [NSMutableArray array];
        for (id color in colors) {
            if ([color isKindOfClass:[UIColor class]]) {
                [bridgeColors addObject:(__bridge id)[color CGColor]];
            }else{
                [bridgeColors addObject:color];
            }
        }
        [self enumerateObjectsUsingBlock:^(CAGradientLayer * _Nonnull obj) {
            [obj setColors:bridgeColors];
        }];
        return self;
    };
}
@end
SSDKCATEGORY_LAYER_IMPLEMENTATION(CAGradientLayer, SSDKGradientLayerChainModel)
#undef SSDKCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION
