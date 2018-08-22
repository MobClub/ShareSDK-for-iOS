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

@class LineSDKConfiguration;
@class LineSDKAccessToken;
@class LineSDKCredential;
@class LineSDKProfile;

NS_ASSUME_NONNULL_BEGIN

@class LineSDKLogin;
@protocol LineSDKLoginDelegate <NSObject>

- (void)didLogin:(LineSDKLogin *)login
      credential:(nullable LineSDKCredential *)credential
         profile:(nullable LineSDKProfile *)profile
           error:(nullable NSError *)error;

@end

@interface LineSDKLogin : NSObject

@property (nonatomic, strong, readonly) LineSDKConfiguration *configuration;
@property (nonatomic, weak, nullable) id<LineSDKLoginDelegate>delegate;

+ (instancetype)sharedInstance;
- (instancetype)init NS_UNAVAILABLE;

- (BOOL)handleOpenURL:(NSURL *)aURL;
- (BOOL)isAuthorizing;
- (BOOL)isAuthorized;
- (BOOL)canLoginWithLineApp;
- (void)installLineApp;

- (void)startLogin;
- (void)startWebLoginWithSafariViewController:(BOOL)useSafariViewControllerIfAvailable;

- (void)startLoginWithPermissions:(NSArray<NSString *> *)permissions;
- (void)startWebLoginWithSafariViewController:(BOOL)useSafariViewControllerIfAvailable
                                  permissions:(NSArray<NSString *> *)permissions;

@end
NS_ASSUME_NONNULL_END
