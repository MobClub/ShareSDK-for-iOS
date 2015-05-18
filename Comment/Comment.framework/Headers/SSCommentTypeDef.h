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
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <ShareSDK/ShareSDK.h>

#ifndef Comment_SSCommentTypeDef_h
#define Comment_SSCommentTypeDef_h

@protocol ISSCTopic;
@protocol ISSCComment;

///#begin zh-cn
/**
 *	@brief	评论列表排序名称
 */
///#end
///#begin en
/**
 *	@brief	Comment list order name.
 */
///#end
typedef enum
{
	SSCCommentListOrderNameLatest = 0, /**< 最新排序 */
	SSCCommentListOrderNameHot = 1 /**< 热门排序 */
}
SSCCommentListOrderName;

///#begin zh-cn
/**
 *	@brief	获取评论ID列表返回事件
 */
///#end
///#begin en
/**
 *	@brief	Get Comment ids result event.
 */
///#end
typedef void(^SSCGetCommentIdsResultEvent) (SSResponseState state, NSArray *commentIds, NSError *error);

///#begin zh-cn
/**
 *	@brief	获取评论信息返回事件
 */
///#end
///#begin en
/**
 *	@brief	Get comment information result event.
 */
///#end
typedef void(^SSCGetCommentInfoResultEvent) (SSResponseState state, NSArray *commentList, NSError *error);

///#begin zh-cn
/**
 *	@brief	获取主题信息返回事件
 */
///#end
///#begin en
/**
 *	@brief	Get topic result event.
 */
///#end
typedef void(^SSCGetTopicResultEvent) (SSResponseState state, id<ISSCTopic> topic, NSError *error);

///#begin zh-cn
/**
 *	@brief	回复内容/评论返回事件
 */
///#end
///#begin en
/**
 *	@brief	Reply content / comment result event.
 */
///#end
typedef void(^SSCReplyResultEvent) (SSResponseState state, id<ISSCComment> comment, NSError *error);

///#begin zh-cn
/**
 *	@brief	称赞内容/评论返回事件
 */
///#end
///#begin en
/**
 *	@brief	Liked content / comment result event.
 */
///#end
typedef void(^SSCLikeResultEvent) (SSResponseState state, NSError *error);

///#begin zh-cn
/**
 *	@brief	分享内容/评论返回事件
 */
///#end
///#begin en
/**
 *	@brief	Share content / comment result event.
 */
///#end
typedef void(^SSCShareResultEvent) (SSResponseState state, NSError *error);

///#begin zh-cn
/**
 *	@brief	评论列表页面返回事件，当点击页面工具栏的返回按钮时回调
 */
///#end
///#begin en
/**
 *	@brief	Comment list page back event. When you click the Back button on the toolbar callback
 */
///#end
typedef void(^SSCCommentListPageBackEvent) ();

///#begin zh-cn
/**
 *	@brief	超过最大内容长度事件
 */
///#end
///#begin en
/**
 *	@brief	Content out of max length event.
 */
///#end
typedef void(^SSCContentOutOfMaxLengthEvent) ();

///#begin zh-cn
/**
 *	@brief	视图将要显示事件
 */
///#end
///#begin en
/**
 *	@brief	View will display event.
 */
///#end
typedef void(^SSCViewWillDiplayEvent) (UIViewController *viewController);


#endif
