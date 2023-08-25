/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#if !TARGET_OS_TV

#import <Foundation/Foundation.h>

@class FBSDKLoginCompletionParameters;

NS_ASSUME_NONNULL_BEGIN

/// Success Block
typedef void (^ FBSDKLoginCompletionParametersBlock)(FBSDKLoginCompletionParameters *parameters)
NS_SWIFT_NAME(LoginCompletionParametersBlock);

NS_ASSUME_NONNULL_END

#endif
