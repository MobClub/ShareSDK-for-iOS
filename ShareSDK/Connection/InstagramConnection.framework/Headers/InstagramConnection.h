//
//  InstagramConnection.h
//  InstagramConnection
//
//  Created by 冯 鸿杰 on 13-10-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSInstagramApp.h"
#import "SSInstagramCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Instagram链接器
 */
@interface InstagramConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	clientId 	应用标识
 *	@param 	clientSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithClientId:(NSString *)clientId
                         clientSecret:(NSString *)clientSecret
                          redirectUri:(NSString *)redirectUri;

@end
