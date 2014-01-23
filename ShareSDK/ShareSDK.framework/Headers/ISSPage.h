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
 *	@brief	Paging info protocol，Data is used to specify which pages to get
 */
@protocol ISSPage <NSObject>

/**
 *	@brief	Get page No.
 *
 *	@return	Page No
 */
- (NSInteger)pageNo;

/**
 *	@brief	Set page No.
 *
 *	@param 	pageNo 	Page No.
 */
- (void)setPageNo:(NSInteger)pageNo;

/**
 *	@brief	Get page size
 *
 *	@return	Page size
 */
- (NSInteger)pageSize;

/**
 *	@brief	Set page size
 *
 *	@param 	pageSize 	Page size
 */
- (void)setPageSize:(NSInteger)pageSize;

/**
 *	@brief	Get cursor
 *
 *	@return	Cursor
 */
- (long long)cursor;

/**
 *	@brief	Set cursor
 *
 *	@param 	cursor 	Cursor
 */
- (void)setCursor:(long long)cursor;

@end
