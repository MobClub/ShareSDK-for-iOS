/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

#import <FBSDKCoreKit_Basics/FBSDKCoreKit_Basics.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FBSDKFeatureChecking;
@protocol FBSDKGraphRequestFactory;
@protocol FBSDKSettings;

/**
 Internal type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
NS_SWIFT_NAME(_CrashObserver)
@interface FBSDKCrashObserver : NSObject <FBSDKCrashObserving>

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

// UNCRUSTIFY_FORMAT_OFF
- (instancetype)initWithFeatureChecker:(id<FBSDKFeatureChecking>)featureChecker
                   graphRequestFactory:(id<FBSDKGraphRequestFactory>)graphRequestFactory
                              settings:(id<FBSDKSettings>)settings
                          crashHandler:(id<FBSDKCrashHandler>)crashHandler
NS_SWIFT_NAME(init(featureChecker:graphRequestFactory:settings:crashHandler:));
// UNCRUSTIFY_FORMAT_ON

@end

NS_ASSUME_NONNULL_END
