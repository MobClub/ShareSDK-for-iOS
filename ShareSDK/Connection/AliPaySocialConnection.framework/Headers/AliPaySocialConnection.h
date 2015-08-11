//
//  AliPaySocialConnection.h
//  AliPaySocialConnection
//
//  Created by chenjd on 15/7/23.
//  Copyright (c) 2015年 Mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSAliPaySocialApp.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	支付宝链接器
 */
///#end
///#begin en
/**
 *	@brief	AliPa Connection.
 */
///#end
@interface AliPaySocialConnection : NSObject <ISSPlatform>

///#begin zh-cn
/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appId 	应用标识
 *	@param 	scene 	分享场景
 *
 *	@return	应用配置信息
 */
///#end
///#begin en
/**
 *	@brief	Create an app configuration information.
 *
 *	@param 	appId 	App id.
 *	@param 	scene 	Scene.
 *
 *	@return	App configuration information.
 */
///#end
- (NSDictionary *)appInfoWithAppId:(NSString *)appId;
@end
