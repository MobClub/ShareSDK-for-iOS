///#begin zh-cn
//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end
///#begin en
//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSSohuUser.h"
#import "SSSohuErrorInfo.h"
#import "SSSohuBookmark.h"
#import <ShareSDK/ShareSDKPlugin.h>

///#begin zh-cn
/**
 *	@brief	搜狐应用协议
 */
///#end
///#begin en
/**
 *	@brief	Sohu App Protocol.
 */
///#end
@protocol ISSSohuApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
///#end
///#begin en
/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
///#end
- (NSString *)appKey;

///#begin zh-cn
/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
///#end
///#begin en
/**
 *	@brief	Get app secret.
 *
 *	@return	App secret.
 */
///#end
- (NSString *)appSecret;

///#begin zh-cn
/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
///#end
///#begin en
/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
///#end
- (NSString *)redirectUri;

///#begin zh-cn
/**
 *	@brief	添加书签
 *
 *	@param 	url 	url地址
 *  @param  result  回调方法
 */
///#end
///#begin en
/**
 *	@brief	Add a bookmark.
 *
 *	@param 	url 	URL string.
 *  @param  result  Result handler.
 */
///#end
- (void)addBookmark:(NSString *)url
             result:(SSShareResultEvent)result;


@end
