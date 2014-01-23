//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#ifndef FacebookConnection_SSFacebookTypeDef_h
#define FacebookConnection_SSFacebookTypeDef_h

/**
 *	@brief	Facebook Dialog Type
 */
typedef enum
{
	SSFacebookDialogTypeFeed = 1, /**< allows a user to post a story to their Timeline and to their friends' News Feeds */
	SSFacebookDialogTypeLogin = 2, /**< allows a user to authorize an application as part of an authentication flow */
	SSFacebookDialogTypeAddPageTab = 3, /**< allows a user to add an application to a Facebook Page which they administer. */
	SSFacebookDialogTypeFriends = 4, /**< allows a user to send a friend request to another user. */
	SSFacebookDialogTypePay = 5, /**< allows a user to make a purchase using Facebook Credits. */
	SSFacebookDialogTypeRequests = 6, /**< allows a user to send a request to one or more of their friends */
	SSFacebookDialogTypeSend = 7 /**< allows a user to send a Facebook Message to one or more of their friends. */
}
SSFacebookDialogType;

/**
 *	@brief	Friends dialog result.
 */
typedef enum
{
	SSFacebookFriendsDialogResultCancel = 0, /**< 取消 */
	SSFacebookFriendsDialogResultSuccess = 1, /**< 成功 */
	SSFacebookFriendsDialogResultFail = 2 /**< 失败 */
}
SSFacebookFriendsDialogResult;

#endif
