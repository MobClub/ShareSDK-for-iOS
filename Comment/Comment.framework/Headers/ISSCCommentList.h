//
//  ISSCCommentList.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSCComment.h"

/**
 *	@brief	更新评论列表返回事件
 */
typedef void(^SSCUpdateCommentListResultEvent) (SSResponseState state, NSError *error);

/**
 *	@brief	获取评论详情返回事件
 */
typedef void(^SSCGetCommentDetailResultEvent) (SSResponseState state, NSError *error);


/**
 *	@brief	评论列表
 */
@protocol ISSCCommentList <NSObject>

/**
 *	@brief	获取列表数据
 *
 *	@return	评论数组
 */
- (NSArray *)data;

/**
 *	@brief	获取排序规则
 *
 *	@return	排序规则
 */
- (NSComparator)order;

/**
 *	@brief	设置列表排序规则
 *
 *	@param 	order 	排序规则
 */
- (void)setOrder:(NSComparator)order;

/**
 *	@brief	从服务器请求新的评论列表（只包含ID和部分信息）
 *
 *	@param 	result 	返回事件
 */
- (void)update:(SSCUpdateCommentListResultEvent)resultHandler;

/**
 *	@brief	根据评论ID列表获取评论详情
 *
 *	@param 	ids 	评论ID列表
 *  @param  resultHandler  返回事件回调
 */
- (void)getCommentsDetailWithIds:(NSArray *)ids
                          result:(SSCGetCommentDetailResultEvent)resultHandler;

@end
