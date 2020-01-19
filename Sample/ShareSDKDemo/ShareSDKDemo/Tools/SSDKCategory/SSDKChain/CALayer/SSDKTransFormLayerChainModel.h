//
//  SSDKTransFormLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTransFormLayerChainModel;
@interface SSDKTransFormLayerChainModel : SSDKBaseLayerChainModel<SSDKTransFormLayerChainModel *>

@end

SSDKCATEGORY_EXINTERFACE(CATransformLayer, SSDKTransFormLayerChainModel)
NS_ASSUME_NONNULL_END
