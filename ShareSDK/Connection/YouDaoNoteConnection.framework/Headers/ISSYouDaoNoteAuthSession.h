//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>

/**
 *	@brief	Authorized Session.
 */
@protocol ISSYouDaoNoteAuthSession <ISSCAuthSession>

/**
 *	@brief	Get whether to allow callbacks to the server identity, default YES
 *
 *	@return	YES said callback server, NO means no callback server
 */
- (BOOL)allowCallback;

/**
 *	@brief Set callback server flag, no server for the client application can be set NO, the information in the received authorization to intercept a callback.
 *
 *	@param 	allowCallback 	Callback flag.
 */
- (void)setAllowCallback:(BOOL)allowCallback;

@end
