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
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
///#end

#import <Foundation/Foundation.h>
#import "ISSCComment.h"

///#begin zh-cn
/**
 *	@brief	更新评论列表返回事件
 */
///#end
///#begin en
/**
 *	@brief	Update comment list result event.
 */
///#end
typedef void(^SSCUpdateCommentListResultEvent) (SSResponseState state, NSError *error);

///#begin zh-cn
/**
 *	@brief	获取评论详情返回事件
 */
///#end
///#begin en
/**
 *	@brief	Get Comment detail information list result event.
 */
///#end
typedef void(^SSCGetCommentDetailResultEvent) (SSResponseState state, NSError *error);

///#begin zh-cn
/**
 *	@brief	评论列表
 */
///#end
///#begin en
/**
 *	@brief	Comment List Protocol.
 */
///#end
@protocol ISSCCommentList <NSObject>

///#begin zh-cn
/**
 *	@brief	获取列表数据
 *
 *	@return	评论数组
 */
///#end
///#begin en
/**
 *	@brief	Get list data.
 *
 *	@return	Comment list.
 */
///#end
- (NSArray *)data;

///#begin zh-cn
/**
 *	@brief	获取排序规则
 *
 *	@return	排序规则
 */
///#end
///#begin en
/**
 *	@brief	Get order method
 *
 *	@return	Order method
 */
///#end
- (NSComparator)order;

///#begin zh-cn
/**
 *	@brief	设置列表排序规则
 *
 *	@param 	order 	排序规则
 */
///#end
///#begin en
/**
 *	@brief	Set order method
 *
 *	@param 	order 	Order method
 */
///#end
- (void)setOrder:(NSComparator)order;

///#begin zh-cn
/**
 *	@brief	从服务器请求新的评论列表（只包含ID和部分信息）
 *
 *	@param 	result 	返回事件
 */
///#end
///#begin en
/**
 *	@brief	Comments from the server requests a new list (and some contain only ID information)
 *
 *	@param 	result 	Result handler.
 */
///#end
- (void)update:(SSCUpdateCommentListResultEvent)resultHandler;

///#begin zh-cn
/**
 *	@brief	根据评论ID列表获取评论详情
 *
 *	@param 	ids 	评论ID列表
 *  @param  resultHandler  返回事件回调
 */
///#end
///#begin en
/**
 *	@brief	Get Review Details list based on comment ids.
 *
 *	@param 	ids 	Comment ids.
 *  @param  resultHandler  Result handler.
 */
///#end
- (void)getCommentsDetailWithIds:(NSArray *)ids
                          result:(SSCGetCommentDetailResultEvent)resultHandler;

@end
