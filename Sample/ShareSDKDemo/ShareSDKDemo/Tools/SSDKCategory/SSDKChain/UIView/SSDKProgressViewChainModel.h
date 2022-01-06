//
//  SSDKProgressViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKProgressViewChainModel;
@interface SSDKProgressViewChainModel : SSDKBaseViewChainModel<SSDKProgressViewChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ progressViewStyle) (UIProgressViewStyle progressViewStyle);
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ progress) (float progress);
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ progressTintColor) (UIColor* progressTintColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ trackTintColor) (UIColor* trackTintColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ progressImage) (UIImage* progressImage);
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ trackImage) (UIImage* trackImage);
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ observedProgress) (NSProgress * observedProgress) API_AVAILABLE(ios(9.0));
SSDKCATEGORY_CHAIN_PROPERTY SSDKProgressViewChainModel * (^ setProgressAnimated) (float progress, BOOL animated);
@end

SSDKCATEGORY_EXINTERFACE(UIProgressView, SSDKProgressViewChainModel)
NS_ASSUME_NONNULL_END
