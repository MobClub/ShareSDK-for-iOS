//
//  SSCommentTypeDef.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>

#ifndef Comment_SSCommentTypeDef_h
#define Comment_SSCommentTypeDef_h

@protocol ISSCTopic;
@protocol ISSCComment;

/**
 *	@brief	评论列表排序名称
 */
typedef enum
{
	SSCCommentListOrderNameLatest = 0, /**< 最新排序 */
	SSCCommentListOrderNameHot = 1 /**< 热门排序 */
}
SSCCommentListOrderName;


/**
 *	@brief	获取评论ID列表返回事件
 */
typedef void(^SSCGetCommentIdsResultEvent) (SSResponseState state, NSArray *commentIds, NSError *error);

/**
 *	@brief	获取评论信息返回事件
 */
typedef void(^SSCGetCommentInfoResultEvent) (SSResponseState state, NSArray *commentList, NSError *error);

/**
 *	@brief	获取主题信息返回事件
 */
typedef void(^SSCGetTopicResultEvent) (SSResponseState state, id<ISSCTopic> topic, NSError *error);

/**
 *	@brief	回复内容/评论返回事件
 */
typedef void(^SSCReplyResultEvent) (SSResponseState state, id<ISSCComment> comment, NSError *error);

/**
 *	@brief	称赞内容/评论返回事件
 */
typedef void(^SSCLikeResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	分享内容/评论返回事件
 */
typedef void(^SSCShareResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	评论列表页面返回事件，当点击页面工具栏的返回按钮时回调
 */
typedef void(^SSCCommentListPageBackEvent) ();

/**
 *	@brief	超过最大内容长度事件
 */
typedef void(^SSCContentOutOfMaxLengthEvent) ();

/**
 *	@brief	视图将要显示事件
 */
typedef void(^SSCViewWillDiplayEvent) (UIViewController *viewController);


#endif
