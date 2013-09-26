//
//  LinkedInConnection.h
//  LinkedInConnection
//
//  Created by 冯 鸿杰 on 13-8-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSLinkedInApp.h"
#import "SSLinkedInCredential.h"

@interface LinkedInConnection : NSObject

/**
 *	@brief	注册应用,同一个AppKey只需要注册一次。
 *
 *  @param  account 授权帐号，使用ShareSDK注册的应用Key换取。
 *	@param 	appKey 	应用Key
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用对象,返回nil则表示应用注册失败。
 */
+ (id<ISSLinkedInApp>)registerApp:(id<ISSCAccount>)account
                           apiKey:(NSString *)apiKey
                        secretKey:(NSString *)secretKey
                      redirectUri:(NSString *)redirectUri;

/**
 *	@brief	注销应用
 *
 *	@param 	app 	应用对象
 *
 *	@return	YES表示注销成功，NO表示注销失败
 */
+ (BOOL)unregisterApp:(id<ISSLinkedInApp>)app;

/**
 *	@brief	取得已注册新浪应用
 *
 *	@param 	appKey 	应用Key
 *
 *	@return	应用对象，返回nil则表示应用尚未注册
 */
+ (id<ISSLinkedInApp>)getApp:(NSString *)appKey;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	sourceData 	源数据
 *
 *	@return	授权凭证
 */
+ (SSLinkedInCredential *)credentialWithData:(NSDictionary *)sourceData;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	credentialData 	授权数据
 *
 *	@return	授权凭证
 */
+ (SSLinkedInCredential *)credentialWithCredentialData:(NSDictionary *)credentialData;

/**
 *	@brief	根据新浪微博错误码返回错误描述
 *
 *	@param 	code 	错误码
 *
 *	@return	错误描述
 */
+ (NSString *)getErrorDescriptionWithCode:(NSInteger)code;

@end
