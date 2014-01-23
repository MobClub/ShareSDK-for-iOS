//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Filtered Event，When the trigger condition is reached
 */
typedef void(^SSCFilteredEvent)();

/**
 *	@brief	Content filter. for submitting comments on the content filtering content.
 *
 */
@protocol ISSCContentFilter <NSObject>

/**
 *	@brief	Filtering content
 *
 *	@param 	content 	Content
 *
 *	@return	YES said filtered content, NO indicates allowed to submit content
 */
- (BOOL)filteringContent:(NSString *)content;

/**
 *	@brief	Set filtered handler.
 *
 *	@param 	handler 	Event handler.
 */
- (void)setFilteredHandler:(SSCFilteredEvent)handler;

/**
 *	@brief	Filter events, triggered when it reaches the filter conditions
 */
- (void)onFiltered;

/**
 *	@brief	Get next content filter.
 *
 *	@return	Content filter.
 */
- (id<ISSCContentFilter>)next;

/**
 *	@brief	Set next content filter.
 *
 *	@param 	next 	Content filter.
 */
- (void)setNext:(id<ISSCContentFilter>)next;


@end
