//
//  EverNoteConnection.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-7.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSEverNoteApp.h"

/**
 *	@brief	印象笔记链接器
 */
@interface EverNoteConnection : NSObject

/**
 *	@brief	注册应用,同一个AppKey只需要注册一次。
 *
 *  @param  account     授权帐号，使用ShareSDK注册的应用Key换取。
 *  @param  appType     应用类型，可以指定是沙箱、印象笔记中国还是Evernote International,注：如果设置了沙箱类型，则需要在发布应用之前把类型改为其他的，否则会导致用户无法正常使用。
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 *
 *	@return	应用对象,返回nil则表示应用注册失败。
 */
+ (id<ISSEverNoteApp>)registerApp:(id<ISSCAccount>)account
                          appType:(SSEverNoteAppType)appType
                      consumerKey:(NSString *)consumerKey
                   consumerSecret:(NSString *)consumerSecret;

/**
 *	@brief	注销应用
 *
 *	@param 	app 	应用对象
 *
 *	@return	YES表示注销成功，NO表示注销失败
 */
+ (BOOL)unregisterApp:(id<ISSEverNoteApp>)app;


/**
 *	@brief	取得已注册新浪应用
 *
 *	@param 	consumerKey 	消费者Key
 *
 *	@return	应用对象，返回nil则表示应用尚未注册
 */
+ (id<ISSEverNoteApp>)getApp:(NSString *)consumerKey;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	sourceData 	源数据
 *
 *	@return	授权凭证
 */
+ (SSEverNoteCredential *)credentialWithData:(NSDictionary *)sourceData;

/**
 *	@brief	创建授权凭证
 *
 *	@param 	credentialData 	授权数据
 *
 *	@return	授权凭证
 */
+ (SSEverNoteCredential *)credentialWithCredentialData:(NSDictionary *)credentialData;

/**
 *	@brief	根据新浪微博错误码返回错误描述
 *
 *	@param 	code 	错误码
 *
 *	@return	错误描述
 */
+ (NSString *)getErrorDescriptionWithCode:(NSInteger)code;

@end
