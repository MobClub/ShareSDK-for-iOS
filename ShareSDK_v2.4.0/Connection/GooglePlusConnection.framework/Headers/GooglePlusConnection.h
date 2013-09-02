//
//  GooglePlusConnection.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-12.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSGooglePlusApp.h"
#import "SSGooglePlusCredential.h"

//Client ID:
//160819254103.apps.googleusercontent.com
//Client secret:
//8tH-l7hw8UVju-8xDiRfMD7U
//Redirect URIs:
//urn:ietf:wg:oauth:2.0:oob
//http://localhost

@interface GooglePlusConnection : NSObject

/**
 *	@brief	注册应用,同一个AppKey只需要注册一次。
 *
 *  @param  account 授权帐号，使用ShareSDK注册的应用Key换取。
 *	@param 	clientId 	应用Key
 *	@param 	clientSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用对象,返回nil则表示应用注册失败。
 */
+ (id<ISSGooglePlusApp>)registerApp:(id<ISSCAccount>)account
                           clientId:(NSString *)clientId
                       clientSecret:(NSString *)clientSecret
                        redirectUri:(NSString *)redirectUri;

/**
 *	@brief	注销应用
 *
 *	@param 	app 	应用对象
 *
 *	@return	YES表示注销成功，NO表示注销失败
 */
+ (BOOL)unregisterApp:(id<ISSGooglePlusApp>)app;


/**
 *	@brief	取得已注册新浪应用
 *
 *	@param 	appKey 	应用Key
 *
 *	@return	应用对象，返回nil则表示应用尚未注册
 */
+ (id<ISSGooglePlusApp>)getApp:(NSString *)appKey;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	sourceData 	源数据
 *
 *	@return	授权凭证
 */
+ (SSGooglePlusCredential *)credentialWithData:(NSDictionary *)sourceData;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	credentialData 	授权数据
 *
 *	@return	授权凭证
 */
+ (SSGooglePlusCredential *)credentialWithCredentialData:(NSDictionary *)credentialData;

/**
 *	@brief	根据新浪微博错误码返回错误描述
 *
 *	@param 	code 	错误码
 *
 *	@return	错误描述
 */
+ (NSString *)getErrorDescriptionWithCode:(NSInteger)code;

@end
