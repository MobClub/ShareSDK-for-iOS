//
//  RennClient.h
//  RennSDK
//
//  Auto Generate on 13-3-19.
//  Copyright (c) 2013年 RenRen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RennAccessToken.h"
#import "RennLoginService.h"
#import "RennService.h"

/*
 * RennService管理类
 */
@interface RennClient : NSObject

// Init with basic app infomation
+ (void)initWithAppId:(NSString *)appId apiKey:(NSString *)apiKey secretKey:(NSString *)secretKey;

// TokenType: bearer/mac. Default bearer
+ (void)setTokenType:(NSString *)type;

// Scope to authorize
+ (void)setScope:(NSString *)scope;

// Default SSO is enabled
+ (void)enableSSO:(BOOL)enable;

// SSO handler
+ (BOOL)handleOpenURL:(NSURL *)url;

// Login using SSO authorization or Wap page.
// If succeed, RennClientDidLogIn will be called.
+ (void)loginWithDelegate:(id<RennLoginDelegate>)delegate;

// Clear the login delegate
+ (void)cancelLogin;

// Logout immediately.
// If succeed, RennClientDidLogOut will be called.
+ (void)logoutWithDelegate:(id<RennLoginDelegate>)delegate;;

// Probably no use
+ (void)cancelLogout;

// Get RennAccessToken struct
+(RennAccessToken *)accessToken;

// Set RennAccessToken struct
+(void)setAccessToken:(RennAccessToken *)accessToken;

// Get User ID
+(NSString *)uid;

// Check if user has logged in
+ (BOOL)isLogin;

// Check if authorization is expired.
+(BOOL)isAuthorizeExpired;

// Check if isLogin && !isAuthorizeExpired
+ (BOOL)isAuthorizeValid;

// Send asyn request with renren api
+ (RennService *)sendAsynRequest:(RennParam *)param delegate:(id)delegate;

// Cancel the request for delegate
+ (void)cancelForDelegate:(id)delegate;

@end

