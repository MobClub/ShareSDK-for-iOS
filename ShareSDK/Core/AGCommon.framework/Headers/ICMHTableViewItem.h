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
 *	@brief	Horizontal Table View Item
 */
@protocol ICMHTableViewItem <NSObject>

@required

/**
 *	@brief	Get reuse identifier.
 *
 *	@return	Reuse identifier.
 */
- (NSString *)reuseIdentifier;

/**
 *	@brief	Get index path.
 *
 *	@return	Index path.
 */
- (NSIndexPath *)indexPath;

/**
 *	@brief	Set index path
 *
 *	@param 	indexPath 	Index path.
 */
- (void)setIndexPath:(NSIndexPath *)indexPath;

/**
 *	@brief	Initialize table view item.
 *
 *	@param 	reuseIdentifier 	Reuse identifier.
 *
 *	@return	Item view.
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;



@end
