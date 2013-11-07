//
//  EverNoteConnection.h
//  EverNoteConnection
//
//  Created by vimfung on 13-5-7.
//  Copyright (c) 2013年 vimfung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSEverNoteApp.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	印象笔记链接器
 */
@interface EverNoteConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appType 	应用类型
 *	@param 	consumerKey 	应用标识
 *	@param 	consumerSecret 	应用密钥
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithAppType:(SSEverNoteAppType)appType
                         consumerKey:(NSString *)consumerKey
                      consumerSecret:(NSString *)consumerSecret;

@end
