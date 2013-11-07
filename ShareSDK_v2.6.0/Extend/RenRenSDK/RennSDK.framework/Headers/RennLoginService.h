//
//  RennLoginService.h
//  RennSDK
//
//  Created by Li Chengliang on 13-4-10.
//  Copyright (c) 2013年 Li Chengliang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @description 第三方应用需实现此协议，登录时传入此类对象，用于完成登录结果的回调
 */
@protocol RennLoginDelegate <NSObject>

@optional

- (void)rennLoginSuccess;
- (void)rennLogoutSuccess;
- (void)rennLoginCancelded;
- (void)rennLoginDidFailWithError:(NSError *)error;
- (void)rennLoginAccessTokenInvalidOrExpired:(NSError *)error;

@end

@interface RennLoginService : NSObject

@property (nonatomic, assign) id<RennLoginDelegate> delegate;

@property (nonatomic, retain) NSString *appId;
@property (nonatomic, retain) NSString *apiKey;
@property (nonatomic, retain) NSString *scope;
@property (nonatomic, retain) NSString *secretKey;
@property (nonatomic, retain) NSString *tokenType;

@property (nonatomic, assign) BOOL enableSSO;

+ (RennLoginService *)sharedRennLoginService;

- (void)login;

- (void)logout;

- (BOOL)handleOpenURL:(NSURL *)url;

@end
