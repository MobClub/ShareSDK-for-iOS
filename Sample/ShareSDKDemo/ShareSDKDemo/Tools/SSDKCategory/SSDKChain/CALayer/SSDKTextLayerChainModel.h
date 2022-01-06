//
//  SSDKTextLayerChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/4.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKTextLayerChainModel;
@interface SSDKTextLayerChainModel : SSDKBaseLayerChainModel<SSDKTextLayerChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ string) (id string);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ font) (CFTypeRef font);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ fontSize) (CGFloat fontSize);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ foregroundColor) (CGColorRef foregroundColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ wrapped) (BOOL wrapped);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ truncationMode) (CATextLayerTruncationMode truncationMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ alignmentMode) (CATextLayerAlignmentMode alignmentMode);
SSDKCATEGORY_CHAIN_PROPERTY SSDKTextLayerChainModel * (^ allowsFontSubpixelQuantization) (BOOL allowsFontSubpixelQuantization);

@end
SSDKCATEGORY_EXINTERFACE(CATextLayer, SSDKTextLayerChainModel)
NS_ASSUME_NONNULL_END
