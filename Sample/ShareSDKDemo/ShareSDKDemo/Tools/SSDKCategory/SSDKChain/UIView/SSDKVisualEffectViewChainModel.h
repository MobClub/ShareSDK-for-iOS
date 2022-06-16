//
//  SSDKVisualEffectViewChainModel.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SSDKVisualEffectViewChainModel;
@interface SSDKVisualEffectViewChainModel : SSDKBaseViewChainModel<SSDKVisualEffectViewChainModel *>
SSDKCATEGORY_CHAIN_PROPERTY SSDKVisualEffectViewChainModel * (^ effect) (UIVisualEffect * effect);
@end

SSDKCATEGORY_EXINTERFACE(UIVisualEffectView, SSDKVisualEffectViewChainModel)
NS_ASSUME_NONNULL_END
