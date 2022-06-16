//
//  SSDKRotationGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKRotationGestureChainModel.h"
#define SSDKCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKRotationGestureChainModel *, UIRotationGestureRecognizer)
@implementation SSDKRotationGestureChainModel
SSDKCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION(rotation, CGFloat)
@end
SSDKCATEGORY_GESTURE_IMPLEMENTATION(UIRotationGestureRecognizer, SSDKRotationGestureChainModel)
#undef SSDKCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION
