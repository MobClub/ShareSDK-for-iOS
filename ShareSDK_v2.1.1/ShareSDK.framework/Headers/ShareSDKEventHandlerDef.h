//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import "ShareSDKTypeDef.h"
#import "ISSUserInfo.h"
#import "ISSPage.h"
#import "ISSStatusInfo.h"

#ifndef ShareSDKInterface_ShareSDKEventHandlerDef_h
#define ShareSDKInterface_ShareSDKEventHandlerDef_h

/**
 *	@brief	授权事件处理器
 *
 *  @param  state  授权状态
 *  @param  error   授权失败的错误信息,仅当state为SSAuthStateFail时有效
 */
typedef void(^SSAuthEventHandler) (SSAuthState state, id<ICMErrorInfo> error);

/**
 *	@brief	获取用户信息事件处理器
 *
 *  @param  result  回复标识，YES：获取成功，NO：获取失败
 *  @param  userInfo     用户信息
 *  @param  error   获取失败的错误信息
 */
typedef void(^SSGetUserInfoEventHandler) (BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error);

/**
 *	@brief	关注用户事件处理器
 *
 *  @param  state  响应状态
 *  @param  userInfo  用户信息
 *  @param  error   关注失败的错误信息
 */
typedef void(^SSFollowUserEventHandler) (SSResponseState state, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error);

/**
 *	@brief	获取关注列表处理器
 *
 *	@param 	result  回复标志，YES：获取成功， NO：获取失败
 *  @param  users   用户信息列表
 *  @param  currPage    当前分页
 *  @param  prevPage    前一页,如果没有则为nil
 *  @param  nextPage    后一页，如果没有则为nil
 *  @param  hasNext     是否有更多数据
 *  @param  error       错误信息，仅当result为NO时有效
 */
typedef void(^SSGetFriendsEventHandler) (BOOL result, NSArray *users, id<ISSPage> currPage, id<ISSPage> prevPage, id<ISSPage> nextPage, BOOL hasNext, id<ICMErrorInfo> error);

/**
 *	@brief	分享内容事件处理器
 *
 *  @param  type    平台类型
 *  @param  state  发布内容状态
 *  @param  statusInfo  分享信息
 *  @param  error   分享内容失败的错误信息
 *  @param  end     分享完毕标志，对于单个平台分享此值为YES，对于多个分享平台此值在最后一个平台分享完毕后为YES。
 */
typedef void(^SSPublishContentEventHandler) (ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end);

/**
 *	@brief	分享菜单项点击事件处理器
 */
typedef void(^SSShareActionSheetItemClickHandler) ();

#endif
