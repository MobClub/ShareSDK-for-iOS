//
//  KakaoStoryConnection.h
//  KakaoStoryConnection
//
//  Created by chenjd on 15/11/17.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	Kakao Story 链接器
 */
///#end
///#begin en
/**
 *	@brief	Kakao Story Connection.
 */
///#end
@interface KakaoStoryConnection : NSObject <ISSPlatform>

///#begin zh-cn
/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appKey          应用标识
 *	@param 	restApiKey      应用Rest Api Key
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用配置信息
 */
///#end
///#begin en
/**
 *	@brief	Create an app configuration information.
 *
 *	@param 	appKey 	App key.
 *	@param 	restApiKey 	Rest Api Key.
 *	@param 	redirectUri 	Redirect uri.
 *
 *	@return	App configuration information.
 */
///#end
- (NSDictionary *)appInfoWithAppKey:(NSString *)appKey
                         restApiKey:(NSString *)restApiKey
                        redirectUri:(NSString *)redirectUri;

@end
