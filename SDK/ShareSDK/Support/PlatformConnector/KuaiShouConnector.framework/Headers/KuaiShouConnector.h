//
//  KuaiShouConnector.h
//  KuaiShouConnector
//
//  Created by cl on 2020/5/15.
//  Copyright © 2020 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface KuaiShouConnector : NSObject
/**
 请求Token 类型

 @param authCode 授权返回的authCode
 @param getUserinfo 继续获取用户信息
 */
typedef void(^SSDKRequestTokenOperation)(NSString *authCode, void(^getUserinfo)(NSString *uid, NSString *token));

/**
 刷新Token 类型

 @param uid 当前请求的用户id
 @param getUserinfo 继续获取用户信息
 */
typedef void(^SSDKRefreshTokenOperation)(NSString *uid, void(^getUserinfo)(NSString *token));

/**
 在用户不希望暴露微信appSecret情况下，可以设置此block，传入token继续请求用户信息
 
 @param operation 请求authToken业务
 */
+ (void)setRequestAuthTokenOperation:(SSDKRequestTokenOperation)operation;

/**
 微信token过期时，在此block中刷新，执行getUserInfo继续执行
 
 @param operation 刷新token业务
 */
+ (void)setRefreshAuthTokenOperation:(SSDKRefreshTokenOperation)operation;

/**
 可以获取被sharesdk截取的微信sdk回调

 @param operation 设置的回调block
 */
+ (void)setWXCallbackOperation:(void(^)(id req,id resp))operation;

/**
 客户端是否安装
 */
+ (BOOL)isInstalledApp;
@end

NS_ASSUME_NONNULL_END
