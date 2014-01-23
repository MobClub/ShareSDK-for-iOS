//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <ShareSDK/ShareSDK.h>

#ifndef Comment_SSCommentTypeDef_h
#define Comment_SSCommentTypeDef_h

@protocol ISSCTopic;
@protocol ISSCComment;

/**
 *	@brief	Comment list order name.
 */
typedef enum
{
	SSCCommentListOrderNameLatest = 0, /**< 最新排序 */
	SSCCommentListOrderNameHot = 1 /**< 热门排序 */
}
SSCCommentListOrderName;

/**
 *	@brief	Get Comment ids result event.
 */
typedef void(^SSCGetCommentIdsResultEvent) (SSResponseState state, NSArray *commentIds, NSError *error);

/**
 *	@brief	Get comment information result event.
 */
typedef void(^SSCGetCommentInfoResultEvent) (SSResponseState state, NSArray *commentList, NSError *error);

/**
 *	@brief	Get topic result event.
 */
typedef void(^SSCGetTopicResultEvent) (SSResponseState state, id<ISSCTopic> topic, NSError *error);

/**
 *	@brief	Reply content / comment result event.
 */
typedef void(^SSCReplyResultEvent) (SSResponseState state, id<ISSCComment> comment, NSError *error);

/**
 *	@brief	Liked content / comment result event.
 */
typedef void(^SSCLikeResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	Share content / comment result event.
 */
typedef void(^SSCShareResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	Comment list page back event. When you click the Back button on the toolbar callback
 */
typedef void(^SSCCommentListPageBackEvent) ();

/**
 *	@brief	Content out of max length event.
 */
typedef void(^SSCContentOutOfMaxLengthEvent) ();

/**
 *	@brief	View will display event.
 */
typedef void(^SSCViewWillDiplayEvent) (UIViewController *viewController);


#endif
