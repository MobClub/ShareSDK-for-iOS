//
//  CALayer+SSDKChain.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SSDKLayerChainHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface CALayer (SSDKChain)

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
