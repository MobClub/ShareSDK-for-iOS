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
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	LinkedIn链接器
 */
@interface LinkedInConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	apiKey 	应用标识
 *	@param 	secretKey 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithApiKey:(NSString *)apiKey
                          secretKey:(NSString *)secretKey
                        redirectUri:(NSString *)redirectUri;


@end
