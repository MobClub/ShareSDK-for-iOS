//
//  Copyright (c) 2016-present, LINE Corporation All rights reserved.
//
//  You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
//  copy and distribute this software in source code or binary form for use
//  in connection with the web services and APIs provided by LINE Corporation.
//
//  As with any software that integrates with the LINE Corporation platform, your use of this software
//  is subject to the LINE Developers Agreement [http://terms2.line.me/LINE_Developers_Agreement].
//  This copyright notice shall be included in all copies or substantial portions of the software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import <LineSDK/LineSDKRequestProtocol.h>

@class LineSDKConfiguration;
@class LineSDKAccessToken;
@class LineSDKVerifyResult;
@class LineSDKProfile;

typedef void(^LineSDKAPITokenRefreshCompletion)(LineSDKAccessToken * _Nullable accessToken, NSError * _Nullable error);
typedef void(^LineSDKAPIVerifyTokenCompletion)(LineSDKVerifyResult * _Nullable result, NSError * _Nullable error);
typedef void(^LineSDKAPIGetProfileCompletion)(LineSDKProfile * _Nullable profile, NSError * _Nullable error);
typedef void(^LineSDKAPILogoutCompletion)(BOOL success, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN
@interface LineSDKAPI : NSObject <LineSDKAuthenticationRefreshDelegate>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithConfiguration:(LineSDKConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

- (void)refreshTokenWithCallbackQueue:(dispatch_queue_t)queue
                           completion:(LineSDKAPITokenRefreshCompletion)completion
                                NS_SWIFT_NAME(refreshToken(queue:completion:));

- (void)verifyTokenWithCallbackQueue:(dispatch_queue_t)queue
                          completion:(LineSDKAPIVerifyTokenCompletion)completion
                                NS_SWIFT_NAME(verifyToken(queue:completion:));

- (void)getProfileWithCallbackQueue:(dispatch_queue_t)queue
                         completion:(LineSDKAPIGetProfileCompletion)completion
                                NS_SWIFT_NAME(getProfile(queue:completion:));

- (void)logoutWithCallbackQueue:(dispatch_queue_t)queue
                     completion:(LineSDKAPILogoutCompletion)completion
                            NS_SWIFT_NAME(logout(queue:completion:));

- (nullable LineSDKAccessToken *)currentAccessToken;

#pragma mark - LineSDKAuthenticationRefreshDelegate

- (void)refreshTokenWithAccessToken:(nullable LineSDKAccessToken *)accessToken
                         completion:(LineSDKAPITokenRefreshCompletion)completion;

@end

@interface LineSDKAPI (Convenience)

// These APIs execute callback on the main-thread.

- (void)refreshTokenWithCompletion:(LineSDKAPITokenRefreshCompletion)completion
    NS_SWIFT_UNAVAILABLE("Use refreshToken(queue: .main, completion:) instead");

- (void)verifyTokenWithCompletion:(LineSDKAPIVerifyTokenCompletion)completion
    NS_SWIFT_UNAVAILABLE("Use verifyToken(queue: .main, completion:) instead");

- (void)getProfileWithCompletion:(LineSDKAPIGetProfileCompletion)completion
    NS_SWIFT_UNAVAILABLE("Use getProfile(queue: .main, completion:) instead");

- (void)logoutWithCompletion:(LineSDKAPILogoutCompletion)completion
    NS_SWIFT_UNAVAILABLE("Use logout(queue: .main, completion:) instead");

@end

NS_ASSUME_NONNULL_END
