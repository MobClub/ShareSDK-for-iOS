//
//  SSDKPanGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKPanGestureChainModel;
@interface SSDKPanGestureChainModel : SSDKBaseGestureChainModel<SSDKPanGestureChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKPanGestureChainModel * (^ minimumNumberOfTouches) (NSUInteger minimumNumberOfTouches);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPanGestureChainModel * (^ maximumNumberOfTouches) (NSUInteger maximumNumberOfTouches);
SSDKCATEGORY_CHAIN_PROPERTY SSDKPanGestureChainModel * (^ translation) (CGPoint translation,UIView *view);
@end

SSDKCATEGORY_EXINTERFACE(UIPanGestureRecognizer, SSDKPanGestureChainModel)
NS_ASSUME_NONNULL_END
