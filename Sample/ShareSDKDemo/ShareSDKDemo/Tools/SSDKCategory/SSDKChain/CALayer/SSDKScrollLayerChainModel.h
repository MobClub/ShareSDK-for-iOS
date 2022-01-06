//
//  SSDKScrollLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKScrollLayerChainModel;
@interface SSDKScrollLayerChainModel : SSDKBaseLayerChainModel<SSDKScrollLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKScrollLayerChainModel * (^ scrollToPoint) (CGPoint point);
SSDKCATEGORY_CHAIN_PROPERTY SSDKScrollLayerChainModel * (^ scrollToRect) (CGRect rect);
SSDKCATEGORY_CHAIN_PROPERTY SSDKScrollLayerChainModel * (^ scrollMode) (CAScrollLayerScrollMode scrollMode);
@end

SSDKCATEGORY_EXINTERFACE(CAScrollLayer, SSDKScrollLayerChainModel)
NS_ASSUME_NONNULL_END
