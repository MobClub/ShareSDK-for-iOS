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
 *	@brief	iPad view controller protocol，Used to describe the iPad display containers
 */
@protocol ISSiPadViewController <NSObject>

/**
 *	@brief	Get view, Said the pop-up menu which is displayed on a view.
 *
 *  @return View object
 */
- (UIView *)view;

/**
 *	@brief	Set view
 *
 *	@param 	view 	View object
 */
- (void)setView:(UIView *)view;

/**
 *	@brief	Get button item, which means that the pop-up menu, which is used to display on the navigation buttons
 *
 *  @return Button item object
 */
- (UIBarButtonItem *)buttonItem;

/**
 *	@brief	Set button item
 *
 *	@param 	buttonItem 	Button item object.
 */
- (void)setButtonItem:(UIBarButtonItem *)buttonItem;

/**
 *	@brief	Get the menu direction
 *
 *	@return	Menu direction
 */
- (UIPopoverArrowDirection)arrowDirection;

/**
 *	@brief	Set the menu direction
 *
 *	@param 	arrowDirection 	Menu direction
 */
- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection;

/**
 *	@brief	Get container display area
 *
 *	@return	Rect object.
 */
- (CGRect)rect;

/**
 *	@brief	Set container display area
 *
 *	@param 	rect 	Rect object.
 */
- (void)setRect:(CGRect)rect;

@end
