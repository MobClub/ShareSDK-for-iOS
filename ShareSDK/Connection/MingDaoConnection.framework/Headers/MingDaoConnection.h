//
//  MingDaoConnection.h
//  MingDaoConnection
//
//  Created by lisa on 14-3-10.
//  Copyright (c) 2014年 lisa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	明道连接器
 */
///#end
///#begin en
/**
 *	@brief	MingDao Connection.
 */
///#end
@interface MingDaoConnection : NSObject <ISSPlatform>

///#begin zh-cn
/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appKey 	应用标识
 *	@param 	appSecret 	应用密钥
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
 *	@param 	appSecret 	App secret.
 *	@param 	redirectUri 	Redirect uri.
 *
 *	@return	App configuration information.
 */
///#end
- (NSDictionary *)appInfoWithAppKey:(NSString *)appkey
                          appSecret:(NSString *)appSecret
                        redirectUri:(NSString *)redirectUri;
@end
