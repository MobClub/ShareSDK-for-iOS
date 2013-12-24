//
//  YiXinConnection.h
//  YiXinConnection
//
//  Created by Nogard on 13-11-27.
//  Copyright (c) 2013年 AppGo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDKPlugin.h>
#import "SSYiXinTypeDef.h"

@interface YiXinConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	appId 	应用标识
 *	@param 	scene 	分享场景
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithAppId:(NSString *)appId
                             scene:(SSYiXinScene)scene;

@end
