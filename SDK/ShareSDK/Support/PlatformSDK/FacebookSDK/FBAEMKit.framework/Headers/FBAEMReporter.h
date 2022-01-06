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

 #import <Foundation/Foundation.h>
 #import "FBAEMNetworking.h"
 #import "FBSKAdNetworkReporting.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(AEMReporter)
@interface FBAEMReporter : NSObject

/**

 Configure networker used for calling Facebook AEM Graph API endpoint
 and Facebook App ID

 This function should be called in application(_:open:options:) from ApplicationDelegate
 and BEFORE [FBAEMReporter enable] function

 @param networker   An optional networker conforms to FBAEMNetworking which handles Graph API request
 @param appID   The Facebook app ID
 */
+ (void)configureWithNetworker:(nullable id<FBAEMNetworking>)networker
                         appID:(NSString *)appID;

/**

 Configure networker used for calling Facebook AEM Graph API endpoint
 and Facebook App ID

 This function should be called in application(_:open:options:) from ApplicationDelegate
 and BEFORE [FBAEMReporter enable] function. We will use SKAdNetwork reporter to prevent
 double counting.

 @param networker   An optional networker conforms to FBAEMNetworking which handles Graph API request
 @param appID   The Facebook app ID
 @param reporter   The SKAdNetwork repoter
 */
+ (void)configureWithNetworker:(nullable id<FBAEMNetworking>)networker
                         appID:(NSString *)appID
                      reporter:(nullable id<FBSKAdNetworkReporting>)reporter;

/**

 Enable AEM reporting

 This function should be called in application(_:open:options:) from ApplicationDelegate
 */
+ (void)enable;

/**

 Handle deeplink

 This function should be called in application(_:open:options:) from ApplicationDelegate
 */
+ (void)handleURL:(NSURL *)url;

/**

 Calculate the conversion value for the app event based on the AEM configuration

 This function should be called when you log any in-app events
 */
+ (void)recordAndUpdateEvent:(NSString *)event
                    currency:(nullable NSString *)currency
                       value:(nullable NSNumber *)value
                  parameters:(nullable NSDictionary<NSString *, id> *)parameters
NS_SWIFT_NAME(recordAndUpdate(event:currency:value:parameters:));

@end

NS_ASSUME_NONNULL_END

#endif
