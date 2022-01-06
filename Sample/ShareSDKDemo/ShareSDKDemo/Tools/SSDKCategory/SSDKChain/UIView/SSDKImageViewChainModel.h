//
//  SSDKImageViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKImageViewChainModel;

@interface SSDKImageViewChainModel : SSDKBaseViewChainModel<SSDKImageViewChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ image)(UIImage *image);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ highlightedImage)(UIImage *highlightedImage);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ highlighted)(BOOL highlighted);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ animationImages)(NSArray <UIImage *> * animationImages);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ highlightedAnimationImages)(NSArray <UIImage *> * highlightedAnimationImages);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ startAnimating)(void);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ stopAnimating)(void);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ animationRepeatCount)(NSInteger animationRepeatCount);

SSDKCATEGORY_CHAIN_PROPERTY SSDKImageViewChainModel *(^ animationDuration)(NSTimeInterval animationDuration);

@end

SSDKCATEGORY_EXINTERFACE(UIImageView, SSDKImageViewChainModel)
NS_ASSUME_NONNULL_END
