//
//  SSDKTransFormLayerChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKTransFormLayerChainModel.h"
#define SSDKCATEGORY_CHAIN_TRANSFORMLAYER_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKTransFormLayerChainModel *, CATransformLayer)

@implementation SSDKTransFormLayerChainModel

@end
SSDKCATEGORY_LAYER_IMPLEMENTATION(CATransformLayer, SSDKTransFormLayerChainModel)
#undef SSDKCATEGORY_CHAIN_TRANSFORMLAYER_IMPLEMENTATION
