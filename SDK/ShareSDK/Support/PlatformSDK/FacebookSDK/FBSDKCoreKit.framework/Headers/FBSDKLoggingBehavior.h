/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 * Constants defining logging behavior.  Use with <[FBSDKSettings setLoggingBehavior]>.
 */

typedef NSString *FBSDKLoggingBehavior NS_TYPED_ENUM NS_SWIFT_NAME(LoggingBehavior);

/// Include access token in logging.
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorAccessTokens;

/// Log performance characteristics
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorPerformanceCharacteristics;

/// Log FBSDKAppEvents interactions
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorAppEvents;

/// Log Informational occurrences
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorInformational;

/// Log cache errors.
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorCacheErrors;

/// Log errors from SDK UI controls
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorUIControlErrors;

/// Log debug warnings from API response, i.e. when friends fields requested, but user_friends permission isn't granted.
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorGraphAPIDebugWarning;

/** Log warnings from API response, i.e. when requested feature will be deprecated in next version of API.
 Info is the lowest level of severity, using it will result in logging all previously mentioned levels.
 */
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorGraphAPIDebugInfo;

/// Log errors from SDK network requests
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorNetworkRequests;

/// Log errors likely to be preventable by the developer. This is in the default set of enabled logging behaviors.
FOUNDATION_EXPORT FBSDKLoggingBehavior const FBSDKLoggingBehaviorDeveloperErrors;

NS_ASSUME_NONNULL_END
