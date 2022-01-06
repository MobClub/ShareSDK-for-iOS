//
//  SSDKSwitchChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/27.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SSDKSwitchChainModel;
@interface SSDKSwitchChainModel : SSDKBaseControlChainModel<SSDKSwitchChainModel *>

SSDKCATEGORY_CHAIN_PROPERTY SSDKSwitchChainModel *(^ on)(BOOL on);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSwitchChainModel *(^ onTintColor)(UIColor *onTintColor);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSwitchChainModel *(^ thumbTintColor)(UIColor *thumbTintColor);

SSDKCATEGORY_CHAIN_PROPERTY SSDKSwitchChainModel *(^ onImage)(UIImage *onImage);
SSDKCATEGORY_CHAIN_PROPERTY SSDKSwitchChainModel *(^ offImage)(UIImage *offImage);

@end

SSDKCATEGORY_EXINTERFACE(UISwitch, SSDKSwitchChainModel)
NS_ASSUME_NONNULL_END
