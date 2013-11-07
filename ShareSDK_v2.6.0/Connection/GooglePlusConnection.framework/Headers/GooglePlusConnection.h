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
#import <ShareSDK/ShareSDKPlugin.h>

@interface GooglePlusConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appKey 	应用标识
 *	@param 	appSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithClientId:(NSString *)clientId
                         clientSecret:(NSString *)clientSecret
                          redirectUri:(NSString *)redirectUri;

@end
