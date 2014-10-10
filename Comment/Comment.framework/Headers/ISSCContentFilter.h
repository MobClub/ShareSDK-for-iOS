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

///#begin zh-cn
/**
 *	@brief	过滤事件，当条件达到时触发
 *
 *  @param  userInfo    自定义数据
 */
///#end
///#begin en
/**
 *	@brief	Filtered Event，When the trigger condition is reached
 *
 *  @param  userInfo    User information.
 */
///#end
typedef void(^SSCFilteredEvent)(NSDictionary *userInfo);

///#begin zh-cn
/**
 *	@brief	内容过滤器，用于在提交评论内容时对内容进行过滤。
 */
///#end
///#begin en
/**
 *	@brief	Content filter. for submitting comments on the content filtering content.
 *
 */
///#end
@protocol ISSCContentFilter <NSObject>

///#begin zh-cn
/**
 *	@brief	过滤内容
 *
 *	@param 	content 	内容
 *
 *	@return	YES 表示被过滤内容，NO 表示允许提交内容
 */
///#end
///#begin en
/**
 *	@brief	Filtering content
 *
 *	@param 	content 	Content
 *
 *	@return	YES said filtered content, NO indicates allowed to submit content
 */
///#end
- (BOOL)filteringContent:(NSString *)content;

///#begin zh-cn
/**
 *	@brief	设置过滤事件处理器
 *
 *	@param 	handler 	事件处理器
 */
///#end
///#begin en
/**
 *	@brief	Set filtered handler.
 *
 *	@param 	handler 	Event handler.
 */
///#end
- (void)setFilteredHandler:(SSCFilteredEvent)handler;

///#begin zh-cn
/**
 *	@brief	过滤事件，当达到过滤条件时触发
 */
///#end
///#begin en
/**
 *	@brief	Filter events, triggered when it reaches the filter conditions
 */
///#end
- (void)onFiltered;

///#begin zh-cn
/**
 *	@brief	获取下一个内容过滤器
 *
 *	@return	内容过滤器
 */
///#end
///#begin en
/**
 *	@brief	Get next content filter.
 *
 *	@return	Content filter.
 */
///#end
- (id<ISSCContentFilter>)next;

///#begin zh-cn
/**
 *	@brief	设置下一个内容过滤器
 *
 *	@param 	next 	内容过滤器
 */
///#end
///#begin en
/**
 *	@brief	Set next content filter.
 *
 *	@param 	next 	Content filter.
 */
///#end
- (void)setNext:(id<ISSCContentFilter>)next;


@end
