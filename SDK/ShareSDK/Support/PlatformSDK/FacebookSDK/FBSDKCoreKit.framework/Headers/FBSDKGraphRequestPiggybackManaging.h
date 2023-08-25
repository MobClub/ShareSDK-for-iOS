/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <FBSDKCoreKit/FBSDKGraphRequestConnecting.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Internal type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
NS_SWIFT_NAME(_GraphRequestPiggybackManaging)
@protocol FBSDKGraphRequestPiggybackManaging

- (void)addPiggybackRequests:(id<FBSDKGraphRequestConnecting>)connection;
- (void)addRefreshPiggyback:(id<FBSDKGraphRequestConnecting>)connection
          permissionHandler:(nullable FBSDKGraphRequestCompletion)permissionHandler;

@end

NS_ASSUME_NONNULL_END
