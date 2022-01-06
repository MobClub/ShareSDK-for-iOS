//
//  SSDKTiledLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTiledLayerChainModel;
@interface SSDKTiledLayerChainModel : SSDKBaseLayerChainModel<SSDKTiledLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKTiledLayerChainModel * (^ levelsOfDetail) (size_t levelsOfDetail);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTiledLayerChainModel * (^ levelsOfDetailBias) (size_t levelsOfDetailBias);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTiledLayerChainModel * (^ tileSize) (CGSize tileSize);
@end

SSDKCATEGORY_EXINTERFACE(CATiledLayer, SSDKTiledLayerChainModel)
NS_ASSUME_NONNULL_END
