//
//  PinterestConnection.h
//  PinterestConnection
//
//  Created by 冯 鸿杰 on 13-8-29.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSPinterestApp.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Pinterest连接器
 */
@interface PinterestConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	clientId 	应用标识
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithClientId:(NSString *)clientId;


@end
