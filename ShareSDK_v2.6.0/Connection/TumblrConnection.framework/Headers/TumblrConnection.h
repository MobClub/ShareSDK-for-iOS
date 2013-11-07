//
//  TumblrConnection.h
//  TumblrConnection
//
//  Created by 冯 鸿杰 on 13-9-5.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSTumblrApp.h"
#import "SSTumblrCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Tumblr连接器
 */
@interface TumblrConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	consumerKey 	应用标识
 *	@param 	consumerSecret 	应用密钥
 *	@param 	callbackUrl 	回调地址
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithConsumerKey:(NSString *)consumerKey
                          consumerSecret:(NSString *)consumerSecret
                             callbackUrl:(NSString *)callbackUrl;

@end
