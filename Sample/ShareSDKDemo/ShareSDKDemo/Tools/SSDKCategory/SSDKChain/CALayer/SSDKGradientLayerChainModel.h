//
//  SSDKGradientLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKGradientLayerChainModel;
@interface SSDKGradientLayerChainModel : SSDKBaseLayerChainModel<SSDKGradientLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKGradientLayerChainModel * (^ colors) (NSArray * colors);
SSDKCATEGORY_CHAIN_PROPERTY SSDKGradientLayerChainModel * (^ locations) (NSArray<NSNumber *> * locations);
SSDKCATEGORY_CHAIN_PROPERTY SSDKGradientLayerChainModel * (^ startPoint) (CGPoint startPoint);
SSDKCATEGORY_CHAIN_PROPERTY SSDKGradientLayerChainModel * (^ endPoint) (CGPoint endPoint);
@end

SSDKCATEGORY_EXINTERFACE(CAGradientLayer, SSDKGradientLayerChainModel)
NS_ASSUME_NONNULL_END
