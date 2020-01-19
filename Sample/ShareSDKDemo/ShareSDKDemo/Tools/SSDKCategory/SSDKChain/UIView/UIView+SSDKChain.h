//
//  UIView+SSDKChain.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSDKViewChainHeader.h"
#import "CALayer+SSDKChain.h"
#import "SSDKGestureChainHeader.h"
NS_ASSUME_NONNULL_BEGIN
@interface UIView (SSDKChain)

SSDKCATEGORY_STRONG_PROPERTY SSDKViewChainModel *(^ addView)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKLabelChainModel *(^ addLabel)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKImageViewChainModel *(^ addImageView)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKControlChainModel *(^ addControl)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKTextFieldChainModel *(^ addTextField)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKButtonChainModel *(^ addButton)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKSwitchChainModel *(^ addSwitch)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKScrollViewChainModel *(^ addScrollView)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKTextViewChainModel *(^ addTextView)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKTableViewChainModel *(^ addTableView)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKCollectionViewChainModel *(^ addCollectionView)(NSInteger tag);

SSDKCATEGORY_STRONG_PROPERTY SSDKLayerChainModel *(^ addLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKShaperLayerChainModel *(^ addShaperLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKEmiiterLayerChainModel *(^ addEmiiterLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKScrollLayerChainModel *(^ addScrollLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKTextLayerChainModel *(^ addTextLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKTiledLayerChainModel *(^ addTiledLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKTransFormLayerChainModel *(^ addTransFormLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKGradientLayerChainModel *(^ addGradientLayer)(void);

SSDKCATEGORY_STRONG_PROPERTY SSDKReplicatorLayerChainModel *(^ addReplicatorLayer)(void);

@end

NS_ASSUME_NONNULL_END
