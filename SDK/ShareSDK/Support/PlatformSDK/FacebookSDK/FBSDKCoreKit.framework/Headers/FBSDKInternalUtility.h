/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <FBSDKCoreKit/FBSDKAppAvailabilityChecker.h>
#import <FBSDKCoreKit/FBSDKAppURLSchemeProviding.h>
#import <FBSDKCoreKit/FBSDKInternalUtilityProtocol.h>
#import <FBSDKCoreKit/_FBSDKWindowFinding.h>

#if !TARGET_OS_TV
 #import <FBSDKCoreKit/FBSDKURLHosting.h>
#endif

@protocol FBSDKErrorCreating;
@protocol FBSDKInfoDictionaryProviding;
@protocol FBSDKSettings;
@protocol __FBSDKLoggerCreating;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(InternalUtility)
@interface FBSDKInternalUtility : NSObject
#if !TARGET_OS_TV
  <FBSDKAppAvailabilityChecker, FBSDKAppURLSchemeProviding, FBSDKInternalUtility, FBSDKURLHosting, _FBSDKWindowFinding>
#else
  <FBSDKAppAvailabilityChecker, FBSDKAppURLSchemeProviding, FBSDKInternalUtility>
#endif

#if !DEBUG
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
#endif

@property (class, nonnull, readonly) FBSDKInternalUtility *sharedUtility;

/**
 Returns bundle for returning localized strings

 We assume a convention of a bundle named FBSDKStrings.bundle, otherwise we
 return the main bundle.
 */
@property (nonatomic, readonly, strong) NSBundle *bundleForStrings;

/**
 Tests whether the supplied URL is a valid URL for opening in the browser.
 @param URL The URL to test.
 @return YES if the URL refers to an http or https resource, otherwise NO.
 */
- (BOOL)isBrowserURL:(NSURL *)URL;

/**
 Checks equality between 2 objects.

 Checks for pointer equality, nils, isEqual:.
 @param object The first object to compare.
 @param other The second object to compare.
 @return YES if the objects are equal, otherwise NO.
 */
- (BOOL)object:(id)object isEqualToObject:(id)other;

/// Attempts to find the first UIViewController in the view's responder chain. Returns nil if not found.
- (nullable UIViewController *)viewControllerForView:(UIView *)view;

/// returns true if the url scheme is registered in the CFBundleURLTypes
- (BOOL)isRegisteredURLScheme:(NSString *)urlScheme;

/// returns currently displayed top view controller.
- (nullable UIViewController *)topMostViewController;

/// returns the current key window
- (nullable UIWindow *)findWindow;

#pragma mark - FB Apps Installed

@property (nonatomic, readonly, assign) BOOL isMessengerAppInstalled;

- (BOOL)isRegisteredCanOpenURLScheme:(NSString *)urlScheme;

/**
 Internal method exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning INTERNAL - DO NOT USE
 */
- (void)configureWithInfoDictionaryProvider:(id<FBSDKInfoDictionaryProviding>)infoDictionaryProvider
                              loggerFactory:(id<__FBSDKLoggerCreating>)loggerFactory
                                   settings:(id<FBSDKSettings>)settings
                               errorFactory:(id<FBSDKErrorCreating>)errorFactory
NS_SWIFT_NAME(configure(infoDictionaryProvider:loggerFactory:settings:errorFactory:));

@end

NS_ASSUME_NONNULL_END
