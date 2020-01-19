//
//  SSDKShaperLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKShaperLayerChainModel;
@interface SSDKShaperLayerChainModel : SSDKBaseLayerChainModel<SSDKShaperLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ path) (CGPathRef path);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ fillColor) (CGColorRef fillColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ fillRule) (CAShapeLayerFillRule fillRule);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ strokeColor) (CGColorRef strokeColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ strokeStart) (CGFloat strokeStart);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ strokeEnd) (CGFloat strokeEnd);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ lineWidth) (CGFloat lineWidth);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ miterLimit) (CGFloat miterLimit);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ lineCap) (CAShapeLayerLineCap lineCap);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ lineJoin) (CAShapeLayerLineJoin lineJoin);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ lineDashPhase) (CGFloat lineDashPhase);
SSDKCATEGORY_CHAIN_PROPERTY SSDKShaperLayerChainModel * (^ lineDashPattern) (NSArray<NSNumber *> * lineDashPattern);
@end

SSDKCATEGORY_EXINTERFACE(CAShapeLayer, SSDKShaperLayerChainModel)
NS_ASSUME_NONNULL_END
