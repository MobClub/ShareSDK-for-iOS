//
//  SSDKSwipeGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKSwipeGestureChainModel.h"
#define SSDKCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKSwipeGestureChainModel *, UISwipeGestureRecognizer)
@implementation SSDKSwipeGestureChainModel
SSDKCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION(numberOfTouchesRequired, NSUInteger)
SSDKCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION(direction, UISwipeGestureRecognizerDirection)
@end
SSDKCATEGORY_GESTURE_IMPLEMENTATION(UISwipeGestureRecognizer, SSDKSwipeGestureChainModel)
#undef SSDKCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION
