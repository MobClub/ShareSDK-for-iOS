//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSCComment.h"

/**
 *	@brief	Update comment list result event.
 */
typedef void(^SSCUpdateCommentListResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	Get Comment detail information list result event.
 */
typedef void(^SSCGetCommentDetailResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	Comment List Protocol.
 */
@protocol ISSCCommentList <NSObject>

/**
 *	@brief	Get list data.
 *
 *	@return	Comment list.
 */
- (NSArray *)data;

/**
 *	@brief	Get order method
 *
 *	@return	Order method
 */
- (NSComparator)order;

/**
 *	@brief	Set order method
 *
 *	@param 	order 	Order method
 */
- (void)setOrder:(NSComparator)order;

/**
 *	@brief	Comments from the server requests a new list (and some contain only ID information)
 *
 *	@param 	result 	Result handler.
 */
- (void)update:(SSCUpdateCommentListResultEvent)resultHandler;

/**
 *	@brief	Get Review Details list based on comment ids.
 *
 *	@param 	ids 	Comment ids.
 *  @param  resultHandler  Result handler.
 */
- (void)getCommentsDetailWithIds:(NSArray *)ids
                          result:(SSCGetCommentDetailResultEvent)resultHandler;

@end
