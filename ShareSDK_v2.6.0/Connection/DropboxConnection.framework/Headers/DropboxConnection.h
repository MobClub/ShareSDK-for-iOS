//
//  DropboxConnection.h
//  DropboxConnection
//
//  Created by 冯 鸿杰 on 13-9-9.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSDropboxApp.h"
#import "SSDropboxCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Dropbox连接器
 */
@interface DropboxConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appKey 	应用标识
 *	@param 	appSecret 	应用密钥
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithAppKey:(NSString *)appKey
                          appSecret:(NSString *)appSecret;

@end
