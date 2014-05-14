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
 *	@brief	水平排版表格列表项
 */
///#end
///#begin en
/**
 *	@brief	Horizontal Table View Item
 */
///#end
@protocol ICMHTableViewItem <NSObject>

@required

///#begin zh-cn
/**
 *	@brief	获取复用标识
 *
 *	@return	复用标识
 */
///#end
///#begin en
/**
 *	@brief	Get reuse identifier.
 *
 *	@return	Reuse identifier.
 */
///#end
- (NSString *)reuseIdentifier;

///#begin zh-cn
/**
 *	@brief	获取位置索引
 *
 *	@return	位置索引
 */
///#end
///#begin en
/**
 *	@brief	Get index path.
 *
 *	@return	Index path.
 */
///#end
- (NSIndexPath *)indexPath;

///#begin zh-cn
/**
 *	@brief	设置位置索引
 *
 *	@param 	indexPath 	位置索引
 */
///#end
///#begin en
/**
 *	@brief	Set index path
 *
 *	@param 	indexPath 	Index path.
 */
///#end
- (void)setIndexPath:(NSIndexPath *)indexPath;

///#begin zh-cn
/**
 *	@brief	根据引用标识初始化
 *
 *	@param 	reuseIdentifier 	复用标识
 *
 *	@return	对象
 */
///#end
///#begin en
/**
 *	@brief	Initialize table view item.
 *
 *	@param 	reuseIdentifier 	Reuse identifier.
 *
 *	@return	Item view.
 */
///#end
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;



@end
