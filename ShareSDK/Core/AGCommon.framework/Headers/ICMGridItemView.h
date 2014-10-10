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
	表格项接口，所有在ZGGridView中显示的项目都需要实现此接口.
 */
///#end
///#begin en
/**
 *	@brief	Grid Item View protocol. All display item in Gridview must be implement this protocol 
 */
///#end
@protocol ICMGridItemView <NSObject>

@required

///#begin zh-cn
/**
 *	@brief	获取数据.
 *
 *	@return	数据对象.
 */
///#end
///#begin en
/**
 *	@brief	Get data.
 *
 *	@return	Data object.
 */
///#end
- (id)data;


///#begin zh-cn
/**
 *	@brief	设置数据.
 *
 *	@param 	data 	数据对象.
 */
///#end
///#begin en
/**
 *	@brief	Set data.
 *
 *	@param 	data 	Data object.
 */
///#end
- (void)setData:(id)data;


///#begin zh-cn
/**
 *	@brief	获取索引
 *
 *	@return	索引值
 */
///#end
///#begin en
/**
 *	@brief	Get index.
 *
 *	@return	Index.
 */
///#end
- (NSInteger)index;

///#begin zh-cn
/**
 *	@brief	设置索引
 *
 *	@param 	index 	索引值
 */
///#end
///#begin en
/**
 *	@brief	Set index
 *
 *	@param 	index 	Index
 */
///#end
- (void)setIndex:(NSInteger)index;

@end
