//
//  ISSCContentFilter.h
//  Comment
//
//  Created by 冯 鸿杰 on 13-11-13.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	过滤事件，当条件达到时触发
 */
typedef void(^SSCFilteredEvent)();


/**
 *	@brief	内容过滤器，用于在提交评论内容时对内容进行过滤。
 *          通过继承此协议可以
 */
@protocol ISSCContentFilter <NSObject>

/**
 *	@brief	过滤内容
 *
 *	@param 	content 	内容
 *
 *	@return	YES 表示被过滤内容，NO 表示允许提交内容
 */
- (BOOL)filteringContent:(NSString *)content;

/**
 *	@brief	设置过滤事件处理器
 *
 *	@param 	handler 	事件处理器
 */
- (void)setFilteredHandler:(SSCFilteredEvent)handler;

/**
 *	@brief	过滤事件，当达到过滤条件时触发
 */
- (void)onFiltered;

/**
 *	@brief	获取下一个内容过滤器
 *
 *	@return	内容过滤器
 */
- (id<ISSCContentFilter>)next;

/**
 *	@brief	设置下一个内容过滤器
 *
 *	@param 	next 	内容过滤器
 */
- (void)setNext:(id<ISSCContentFilter>)next;


@end
