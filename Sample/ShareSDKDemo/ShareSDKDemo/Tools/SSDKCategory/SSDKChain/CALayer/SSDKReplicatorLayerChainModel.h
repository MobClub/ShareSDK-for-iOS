//
//  SSDKReplicatorLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKReplicatorLayerChainModel;
@interface SSDKReplicatorLayerChainModel : SSDKBaseLayerChainModel<SSDKReplicatorLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceCount) (NSInteger instanceCount);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ preservesDepth) (BOOL preservesDepth);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceDelay) (CFTimeInterval instanceDelay);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceTransform) (CATransform3D instanceTransform);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceColor) (CGColorRef instanceColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceRedOffset) (float instanceRedOffset);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceGreenOffset) (float instanceGreenOffset);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceBlueOffset) (float instanceBlueOffset);
SSDKCATEGORY_CHAIN_PROPERTY SSDKReplicatorLayerChainModel * (^ instanceAlphaOffset) (float instanceAlphaOffset);
@end

SSDKCATEGORY_EXINTERFACE(CAReplicatorLayer, SSDKReplicatorLayerChainModel)
NS_ASSUME_NONNULL_END
