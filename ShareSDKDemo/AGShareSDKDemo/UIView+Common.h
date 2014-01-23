//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIView (Common)

/**
 *	@brief	Get view left.
 *
 *	@return Coordinate value
 */
- (CGFloat)left;

/**
 *	@brief	Get view top
 *
 *	@return	Coordinate value
 */
- (CGFloat)top;

/**
 *	@brief	Get view right
 *
 *	@return	Coordinate value
 */
- (CGFloat)right;

/**
 *	@brief	Get view bottom
 *
 *	@return	Coordinate value
 */
- (CGFloat)bottom;

/**
 *	@brief	Get view width
 *
 *	@return	width（pixel）
 */
- (CGFloat)width;

/**
 *	@brief	Get view height.
 *
 *	@return	height（pixel）
 */
- (CGFloat)height;

/**
 *	@brief	Remove all sub views.
 */
- (void)removeAllSubviews;


@end
