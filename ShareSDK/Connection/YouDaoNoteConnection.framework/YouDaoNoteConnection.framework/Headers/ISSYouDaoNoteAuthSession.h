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

///#begin zh-cn
/**
 *	@brief	授权会话
 */
///#end
///#begin en
/**
 *	@brief	Authorized Session.
 */
///#end
@protocol ISSYouDaoNoteAuthSession <ISSCAuthSession>

///#begin zh-cn
/**
 *	@brief	获取是否允许回调到服务器标识，默认YES
 *
 *	@return	YES 表示回调服务器，NO 表示不回调服务器
 */
///#end
///#begin en
/**
 *	@brief	Get whether to allow callbacks to the server identity, default YES
 *
 *	@return	YES said callback server, NO means no callback server
 */
///#end
- (BOOL)allowCallback;

///#begin zh-cn
/**
 *	@brief	设置回调服务器标识，对于没有服务器的客户端应用可以设置为NO，则在接收授权信息后拦截回调。
 *
 *	@param 	allowCallback 	回调服务器标识
 */
///#end
///#begin en
/**
 *	@brief Set callback server flag, no server for the client application can be set NO, the information in the received authorization to intercept a callback.
 *
 *	@param 	allowCallback 	Callback flag.
 */
///#end
- (void)setAllowCallback:(BOOL)allowCallback;

@end
