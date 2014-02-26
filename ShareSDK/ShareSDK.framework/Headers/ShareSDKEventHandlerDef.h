//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import "ShareSDKTypeDef.h"
#import "ISSPage.h"
#import "ShareSDKPlugin.h"

#ifndef ShareSDKInterface_ShareSDKEventHandlerDef_h
#define ShareSDKInterface_ShareSDKEventHandlerDef_h

/**
 *	@brief	Authorize event handler.
 *
 *  @param  state  Authorized state.
 *  @param  error   Error information, When the state is SSAuthStateFail only valid
 */
typedef void(^SSAuthEventHandler) (SSAuthState state, id<ICMErrorInfo> error);

/**
 *	@brief	Get user information event handler.
 *
 *  @param  result  Result identity, YES: to succeed, NO: Failed to get
 *  @param  userInfo     User object.
 *  @param  error   Error information.
 */
typedef void(^SSGetUserInfoEventHandler) (BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error);

/**
 *	@brief	Concerned about the user event handler
 *
 *  @param  state  Response state.
 *  @param  userInfo  User object.
 *  @param  error   error information.
 */
typedef void(^SSFollowUserEventHandler) (SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error);

/**
 *	@brief	Get friends event handler.
 *
 *	@param 	result  Reply flag, YES: to succeed, NO: Failed to get
 *  @param  users   Users list.
 *  @param  currPage    Current page.
 *  @param  prevPage    Previous page, if none is nil
 *  @param  nextPage    Next page，if none is nil
 *  @param  hasNext     Are there more data
 *  @param  error       Error Info，Valid only when the result is NO
 */
typedef void(^SSGetFriendsEventHandler) (BOOL result, NSArray *users, id<ISSPage> currPage, id<ISSPage> prevPage, id<ISSPage> nextPage, BOOL hasNext, id<ICMErrorInfo> error);

/**
 *	@brief	Share content event handler
 *
 *  @param  type    Platform type
 *  @param  state  Publish state.
 *  @param  statusInfo  Share information object.
 *  @param  error   Error handler.
 *  @param  end     Share finished flag, for a single platform to share this value YES, for multiple platforms to share this value after completion of the final share a platform for YES.
 */
typedef void(^SSPublishContentEventHandler) (ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end);

/**
 *	@brief	Share menu item click event handler.
 */
typedef void(^SSShareActionSheetItemClickHandler) ();

/**
 *	@brief	Obtain coins notification.
 */
typedef void(^SSAwardObtainCoinsHandler) (SSObtainCoinsAction action, NSInteger coins);

/**
 *	@brief	Buy item notification.
 */
typedef void(^SSAwardBuyItemHandler) (SSResponseState state, NSString *itemId, NSString *data, NSString *errorMsg);



#endif
