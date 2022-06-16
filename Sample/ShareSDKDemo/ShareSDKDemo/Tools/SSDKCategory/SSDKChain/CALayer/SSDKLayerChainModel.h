//
//  SSDKLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKLayerChainModel;
@interface SSDKLayerChainModel : SSDKBaseLayerChainModel<SSDKLayerChainModel *>

@end

SSDKCATEGORY_EXINTERFACE(CALayer, SSDKLayerChainModel)
NS_ASSUME_NONNULL_END
