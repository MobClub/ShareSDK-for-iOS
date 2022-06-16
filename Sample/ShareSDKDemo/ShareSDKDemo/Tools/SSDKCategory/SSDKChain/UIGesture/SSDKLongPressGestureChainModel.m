//
//  SSDKLongPressGestureChainModel.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/31.
//  Copyright © 2018 mob. All rights reserved.
//

#import "SSDKLongPressGestureChainModel.h"
#define SSDKCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(SSDKMethod,SSDKParaType) SSDKCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(SSDKMethod,SSDKParaType, SSDKLongPressGestureChainModel *, UILongPressGestureRecognizer)
@implementation SSDKLongPressGestureChainModel
SSDKCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(numberOfTapsRequired, NSUInteger)
SSDKCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(minimumPressDuration, NSTimeInterval)
SSDKCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(allowableMovement, CGFloat)
@end
SSDKCATEGORY_GESTURE_IMPLEMENTATION(UILongPressGestureRecognizer, SSDKLongPressGestureChainModel)
#undef SSDKCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION
