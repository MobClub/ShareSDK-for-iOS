//
//  SSDKTapGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKTapGestureChainModel.h"

#define SSDKCATEGORY_CHAIN_TAPGESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKTapGestureChainModel *, UITapGestureRecognizer)
@implementation SSDKTapGestureChainModel
SSDKCATEGORY_CHAIN_TAPGESTURE_IMPLEMENTATION(numberOfTapsRequired,NSUInteger)
@end
SSDKCATEGORY_GESTURE_IMPLEMENTATION(UITapGestureRecognizer, SSDKTapGestureChainModel)
#undef SSDKCATEGORY_CHAIN_TAPGESTURE_IMPLEMENTATION
