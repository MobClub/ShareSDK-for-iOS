//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	分页对象协议，用于获取分页数据时标识分页信息
 */
@protocol ISSPage <NSObject>

/**
 *	@brief	获取页码
 *
 *	@return	页码
 */
- (NSInteger)pageNo;

/**
 *	@brief	设置页码
 *
 *	@param 	pageNo 	页码
 */
- (void)setPageNo:(NSInteger)pageNo;

/**
 *	@brief	获取分页大小
 *
 *	@return	分页大小
 */
- (NSInteger)pageSize;

/**
 *	@brief	设置分页大小
 *
 *	@param 	pageSize 	分页大小
 */
- (void)setPageSize:(NSInteger)pageSize;

/**
 *	@brief	获取分页游标
 *
 *	@return	分页游标
 */
- (long long)cursor;

/**
 *	@brief	设置分页游标
 *
 *	@param 	cursor 	分页游标
 */
- (void)setCursor:(long long)cursor;

@end
