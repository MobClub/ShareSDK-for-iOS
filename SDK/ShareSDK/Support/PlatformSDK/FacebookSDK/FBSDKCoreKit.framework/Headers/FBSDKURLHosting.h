/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>

#if !TARGET_OS_TV

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(URLHosting)
@protocol FBSDKURLHosting

/**
 Internal Type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
- (nullable NSURL *)appURLWithHost:(NSString *)host
                              path:(NSString *)path
                   queryParameters:(NSDictionary<NSString *, NSString *> *)queryParameters
                             error:(NSError *__autoreleasing *)errorRef;

/**
 Internal Type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
- (nullable NSURL *)facebookURLWithHostPrefix:(NSString *)hostPrefix
                                         path:(NSString *)path
                              queryParameters:(NSDictionary<NSString *, NSString *> *)queryParameters
                                        error:(NSError *__autoreleasing *)errorRef
NS_SWIFT_NAME(facebookURL(hostPrefix:path:queryParameters:));


@end

NS_ASSUME_NONNULL_END

#endif
