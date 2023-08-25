/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(IntegrityProcessing)
@protocol FBSDKIntegrityProcessing

- (BOOL)processIntegrity:(nullable NSString *)parameter;

@end

NS_ASSUME_NONNULL_END
