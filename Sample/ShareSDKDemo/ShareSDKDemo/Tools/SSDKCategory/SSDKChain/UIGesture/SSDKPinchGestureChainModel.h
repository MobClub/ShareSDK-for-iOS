//
//  SSDKPinchGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKPinchGestureChainModel;
@interface SSDKPinchGestureChainModel : SSDKBaseGestureChainModel<SSDKPinchGestureChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKPinchGestureChainModel * (^ scale) (CGFloat scale);
@end

SSDKCATEGORY_EXINTERFACE(UIPinchGestureRecognizer, SSDKPinchGestureChainModel)
NS_ASSUME_NONNULL_END
