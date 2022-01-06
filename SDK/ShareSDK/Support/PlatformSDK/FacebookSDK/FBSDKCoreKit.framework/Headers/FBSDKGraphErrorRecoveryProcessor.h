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

#if !TARGET_OS_TV

#import <Foundation/Foundation.h>

#import <FBSDKCoreKit/FBSDKConstants.h>

NS_ASSUME_NONNULL_BEGIN

@class FBSDKGraphErrorRecoveryProcessor;
@protocol FBSDKGraphRequest;

/**
  Defines a delegate for `FBSDKGraphErrorRecoveryProcessor`.
 */
NS_SWIFT_NAME(GraphErrorRecoveryProcessorDelegate)
@protocol FBSDKGraphErrorRecoveryProcessorDelegate<NSObject>

/**
  Indicates the error recovery has been attempted.
 @param processor the processor instance.
 @param didRecover YES if the recovery was successful.
 @param error the error that that was attempted to be recovered from.
 */
- (void)processorDidAttemptRecovery:(FBSDKGraphErrorRecoveryProcessor *)processor
                         didRecover:(BOOL)didRecover
                              error:(nullable NSError *)error;

@optional
/**
  Indicates the processor is about to process the error.
 @param processor the processor instance.
 @param error the error is about to be processed.

 return NO if the processor should not process the error. For example,
 if you want to prevent alerts of localized messages but otherwise perform retries and recoveries,
 you could return NO for errors where userInfo[FBSDKGraphRequestErrorKey] equal to FBSDKGraphRequestErrorOther
 */
- (BOOL)processorWillProcessError:(FBSDKGraphErrorRecoveryProcessor *)processor
                            error:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

/**
  Defines a type that can process Facebook NSErrors with best practices.

 Facebook NSErrors can contain FBSDKErrorRecoveryAttempting instances to recover from errors, or
 localized messages to present to the user. This class will process the instances as follows:

 1. If the error is temporary as indicated by FBSDKGraphRequestErrorKey, assume the recovery succeeded and
 notify the delegate.
 2. If a FBSDKErrorRecoveryAttempting instance is available, display an alert (dispatched to main thread)
 with the recovery options and call the instance's [ attemptRecoveryFromError:optionIndex:...].
 3. If a FBSDKErrorRecoveryAttempting is not available, check the userInfo for FBSDKLocalizedErrorDescriptionKey
 and present that in an alert (dispatched to main thread).

 By default, FBSDKGraphRequests use this type to process errors and retry the request upon a successful
 recovery.

 Note that Facebook recovery attempters can present UI or even cause app switches (such as to login). Any such
 work is dispatched to the main thread (therefore your request handlers may then run on the main thread).

 Login recovery requires FBSDKLoginKit. Login will prompt the user
 for all permissions last granted. If any are declined on the new request, the recovery is not successful but
 the `[FBSDKAccessToken currentAccessToken]` might still have been updated.
 .
 */
NS_SWIFT_NAME(GraphErrorRecoveryProcessor)
@interface FBSDKGraphErrorRecoveryProcessor : NSObject

/**
 Initializes a GraphErrorRecoveryProcessor with an access token string.
 */
- (instancetype)initWithAccessTokenString:(NSString *)accessTokenString;

/**
  Attempts to process the error, return YES if the error can be processed.
 @param error the error to process.
 @param request the related request that may be reissued.
 @param delegate the delegate that will be retained until recovery is complete.
 */
- (BOOL)processError:(NSError *)error
             request:(id<FBSDKGraphRequest>)request
            delegate:(nullable id<FBSDKGraphErrorRecoveryProcessorDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END

#endif
