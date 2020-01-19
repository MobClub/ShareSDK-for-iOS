//
//  SSDKSwipeGestureChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SSDKSwipeGestureChainModel;
@interface SSDKSwipeGestureChainModel : SSDKBaseGestureChainModel<SSDKSwipeGestureChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKSwipeGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSwipeGestureChainModel * (^ direction) (UISwipeGestureRecognizerDirection direction);
@end


SSDKCATEGORY_EXINTERFACE(UISwipeGestureRecognizer, SSDKSwipeGestureChainModel)
NS_ASSUME_NONNULL_END
