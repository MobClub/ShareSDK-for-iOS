//
//  SSDKPinchGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKPinchGestureChainModel.h"
#define SSDKCATEGORY_CHAIN_PINGESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKPinchGestureChainModel *, UIPinchGestureRecognizer)
@implementation SSDKPinchGestureChainModel
SSDKCATEGORY_CHAIN_PINGESTURE_IMPLEMENTATION(scale, CGFloat)
@end
SSDKCATEGORY_GESTURE_IMPLEMENTATION(UIPinchGestureRecognizer, SSDKPinchGestureChainModel)
#undef SSDKCATEGORY_CHAIN_PINGESTURE_IMPLEMENTATION
