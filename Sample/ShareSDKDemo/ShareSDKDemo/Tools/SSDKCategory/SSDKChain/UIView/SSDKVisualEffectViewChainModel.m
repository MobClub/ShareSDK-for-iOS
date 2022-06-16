//
//  SSDKVisualEffectViewChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/11.
//  Copyright © 2019 mob. All rights reserved.
//

#import "SSDKVisualEffectViewChainModel.h"
#define SSDKCATEGORY_CHAIN_VISUALEFFECT_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKVisualEffectViewChainModel *,UIVisualEffectView)
SSDKCATEGORY_VIEW_IMPLEMENTATION(UIVisualEffectView, SSDKVisualEffectViewChainModel)
@implementation SSDKVisualEffectViewChainModel
SSDKCATEGORY_CHAIN_VISUALEFFECT_IMPLEMENTATION(effect,UIVisualEffect*)
@end
#undef SSDKCATEGORY_CHAIN_VISUALEFFECT_IMPLEMENTATION
