/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

#import <FBSDKCoreKit/FBSDKAuthenticationTokenProviding.h>

@class FBSDKAuthenticationTokenClaims;
@protocol FBSDKTokenCaching;

NS_ASSUME_NONNULL_BEGIN

/// Represent an AuthenticationToken used for a login attempt
NS_SWIFT_NAME(AuthenticationToken)
@interface FBSDKAuthenticationToken : NSObject <NSCopying, NSObject, NSSecureCoding, FBSDKAuthenticationTokenProviding>

/**
 Internal init method exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
- (instancetype)initWithTokenString:(NSString *)tokenString
                              nonce:(NSString *)nonce
                        graphDomain:(NSString *)graphDomain;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
 The "global" authentication token that represents the currently logged in user.

 The `currentAuthenticationToken` represents the authentication token of the
 current user and can be used by a client to verify an authentication attempt.
 */
@property (class, nullable, nonatomic, copy) FBSDKAuthenticationToken *currentAuthenticationToken NS_SWIFT_NAME(current);

/// The raw token string from the authentication response
@property (nonatomic, readonly, copy) NSString *tokenString;

/// The nonce from the decoded authentication response
@property (nonatomic, readonly, copy) NSString *nonce;

/// The graph domain where the user is authenticated.
@property (nonatomic, readonly, copy) NSString *graphDomain;

/// Returns the claims encoded in the AuthenticationToken
- (nullable FBSDKAuthenticationTokenClaims *)claims;

/**
 Internal Type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
@property (class, nullable, nonatomic, copy) id<FBSDKTokenCaching> tokenCache;

#pragma mark - Test methods

#if DEBUG
- (instancetype)initWithTokenString:(NSString *)tokenString
                              nonce:(NSString *)nonce;
+ (void)resetCurrentAuthenticationTokenCache;
#endif

@end

NS_ASSUME_NONNULL_END
