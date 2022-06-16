//
//  SSDKLongPressGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKLongPressGestureChainModel;
@interface SSDKLongPressGestureChainModel : SSDKBaseGestureChainModel<SSDKLongPressGestureChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKLongPressGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);

SSDKCATEGORY_CHAIN_PROPERTY SSDKLongPressGestureChainModel * (^ minimumPressDuration) (NSTimeInterval minimumPressDuration);
SSDKCATEGORY_CHAIN_PROPERTY SSDKLongPressGestureChainModel * (^ allowableMovement) (CGFloat allowableMovement);
@end

SSDKCATEGORY_EXINTERFACE(UILongPressGestureRecognizer, SSDKLongPressGestureChainModel)
NS_ASSUME_NONNULL_END
