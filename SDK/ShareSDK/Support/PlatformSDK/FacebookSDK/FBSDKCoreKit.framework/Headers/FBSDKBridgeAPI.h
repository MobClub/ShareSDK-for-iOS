// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TargetConditionals.h"

#if !TARGET_OS_TV

#import <UIKit/UIKit.h>

#import <FBSDKCoreKit/FBSDKBridgeAPIProtocol.h>
#import <FBSDKCoreKit/FBSDKBridgeAPIProtocolType.h>
#import <FBSDKCoreKit/FBSDKBridgeAPIRequest.h>
#import <FBSDKCoreKit/FBSDKBridgeAPIRequestOpening.h>
#import <FBSDKCoreKit/FBSDKBridgeAPIResponse.h>
#import <FBSDKCoreKit/FBSDKConstants.h>
#import <FBSDKCoreKit/FBSDKURLOpening.h>

@class FBSDKLogger;
@protocol FBSDKOperatingSystemVersionComparing;
@protocol FBSDKInternalURLOpener;
@protocol FBSDKBridgeAPIResponseCreating;
@protocol FBSDKDynamicFrameworkResolving;
@protocol FBSDKAppURLSchemeProviding;

NS_ASSUME_NONNULL_BEGIN

/**
 Internal Type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning UNSAFE - DO NOT USE
 */
typedef void (^FBSDKAuthenticationCompletionHandler)(NSURL *_Nullable callbackURL, NSError *_Nullable error);

/**
 Internal Type exposed to facilitate transition to Swift.
 API Subject to change or removal without warning. Do not use.

 @warning UNSAFE - DO NOT USE
 */
NS_SWIFT_NAME(BridgeAPI)
@interface FBSDKBridgeAPI : NSObject <FBSDKBridgeAPIRequestOpening>

@property (class, nonatomic, readonly, strong) FBSDKBridgeAPI *sharedInstance
NS_SWIFT_NAME(shared);
@property (nonatomic, readonly, getter=isActive) BOOL active;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithProcessInfo:(id<FBSDKOperatingSystemVersionComparing>)processInfo
                             logger:(FBSDKLogger *)logger
                          urlOpener:(id<FBSDKInternalURLOpener>)urlOpener
           bridgeAPIResponseFactory:(id<FBSDKBridgeAPIResponseCreating>)bridgeAPIResponseFactory
                    frameworkLoader:(id<FBSDKDynamicFrameworkResolving>)frameworkLoader
               appURLSchemeProvider:(id<FBSDKAppURLSchemeProviding>)appURLSchemeProvider
NS_DESIGNATED_INITIALIZER;

- (void)openURLWithSafariViewController:(NSURL *)url
                                 sender:(nullable id<FBSDKURLOpening>)sender
                     fromViewController:(nullable UIViewController *)fromViewController
                                handler:(FBSDKSuccessBlock)handler;

- (void)openURL:(NSURL *)url
         sender:(nullable id<FBSDKURLOpening>)sender
        handler:(FBSDKSuccessBlock)handler;

- (FBSDKAuthenticationCompletionHandler)sessionCompletionHandler;

@end

NS_ASSUME_NONNULL_END

#endif
