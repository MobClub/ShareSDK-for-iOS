//
//  SSDKRotationGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKRotationGestureChainModel;
@interface SSDKRotationGestureChainModel : SSDKBaseGestureChainModel<SSDKRotationGestureChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKRotationGestureChainModel * (^ rotation) (CGFloat rotation);
@end

SSDKCATEGORY_EXINTERFACE(UIRotationGestureRecognizer, SSDKRotationGestureChainModel)
NS_ASSUME_NONNULL_END
