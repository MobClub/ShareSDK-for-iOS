//
//  SSDKEmiiterLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKEmiiterLayerChainModel;
@interface SSDKEmiiterLayerChainModel : SSDKBaseLayerChainModel<SSDKEmiiterLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterCells) (NSArray<CAEmitterCell *> * emitterCells);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ birthRate) (float birthRate);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ lifetime) (float lifetime);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterPosition) (CGPoint emitterPosition);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterZPosition) (CGFloat emitterZPosition);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterSize) (CGSize emitterSize);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterDepth) (CGFloat emitterDepth);

#ifdef __IPHONE_12_0
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterShape) (CAEmitterLayerEmitterShape emitterShape);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ emitterMode) (CAEmitterLayerEmitterMode emitterMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ renderMode) (CAEmitterLayerRenderMode renderMode);

#endif
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ preservesDepth) (BOOL preservesDepth);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ velocity) (float velocity);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ scale) (float scale);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ spin) (float spin);
SSDKCATEGORY_CHAIN_PROPERTY SSDKEmiiterLayerChainModel * (^ seed) (unsigned int seed);

@end

SSDKCATEGORY_EXINTERFACE(CAEmitterLayer, SSDKEmiiterLayerChainModel)
NS_ASSUME_NONNULL_END
