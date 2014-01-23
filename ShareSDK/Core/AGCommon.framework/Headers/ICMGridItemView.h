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
 *	@brief	Grid Item View protocol. All display item in Gridview must be implement this protocol 
 */
@protocol ICMGridItemView <NSObject>

@required

/**
 *	@brief	Get data.
 *
 *	@return	Data object.
 */
- (id)data;


/**
 *	@brief	Set data.
 *
 *	@param 	data 	Data object.
 */
- (void)setData:(id)data;


/**
 *	@brief	Get index.
 *
 *	@return	Index.
 */
- (NSInteger)index;

/**
 *	@brief	Set index
 *
 *	@param 	index 	Index
 */
- (void)setIndex:(NSInteger)index;

@end
