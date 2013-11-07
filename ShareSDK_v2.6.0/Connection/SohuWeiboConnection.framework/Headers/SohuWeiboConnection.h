//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSSohuWeiboApp.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	搜狐微博连接器
 */
@interface SohuWeiboConnection : NSObject <ISSPlatform>

/**
 *	@brief	创建应用配置信息
 *
 *	@param 	consumerKey 	应用标识
 *	@param 	consumerSecret 	应用密钥
 *	@param 	redirectUri 	回调地址
 *
 *	@return	应用配置信息
 */
- (NSDictionary *)appInfoWithConsumerKey:(NSString *)consumerKey
                          consumerSecret:(NSString *)consumerSecret
                             redirectUri:(NSString *)redirectUri;

@end
