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

#ifndef FacebookConnection_SSFacebookTypeDef_h
#define FacebookConnection_SSFacebookTypeDef_h

///#begin zh-cn
/**
 *	@brief	Facebook对话框类型
 */
///#end
///#begin en
/**
 *	@brief	Facebook Dialog Type
 */
///#end
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

///#begin zh-cn
/**
 *	@brief	好友请求对话框返回状态
 */
///#end
///#begin en
/**
 *	@brief	Friends dialog result.
 */
///#end
typedef enum
{
	SSFacebookFriendsDialogResultCancel = 0, /**< 取消 */
	SSFacebookFriendsDialogResultSuccess = 1, /**< 成功 */
	SSFacebookFriendsDialogResultFail = 2 /**< 失败 */
}
SSFacebookFriendsDialogResult;

#endif
