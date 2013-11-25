//
//  VKontakteConnection.h
//  VKontakteConnection
//
//  Created by 冯 鸿杰 on 13-10-11.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSVKontakteApp.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	VKontakte连接器
 */
@interface VKontakteConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	applicationId 	应用标识
 *	@param 	secretKey 	应用密钥
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithApplicationId:(NSString *)applicationId
                                 secretKey:(NSString *)secretKey;

@end
