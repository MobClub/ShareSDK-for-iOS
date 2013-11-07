//
//  FlickrConnection.h
//  FlickrConnection
//
//  Created by 冯 鸿杰 on 13-9-3.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSFlickrApp.h"
#import "SSFlickrCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

@interface FlickrConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	apiKey 	应用标识
 *	@param 	apiSecret 	应用密钥
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithApiKey:(NSString *)apiKey
                          apiSecret:(NSString *)apiSecret;

@end
