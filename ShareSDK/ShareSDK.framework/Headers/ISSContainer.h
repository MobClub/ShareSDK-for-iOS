//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSiPadViewController.h"

/**
 *	@brief	Container object procotol.
 */
@protocol ISSContainer <NSObject>

@required

/**
 *	@brief	Get iPhone container controller.
 *
 *	@return	View controller.
 */
- (UIViewController *)iPhoneViewController;

/**
 *	@brief	Get iPad container controller.
 *
 *	@return	View controller.
 */
- (id<ISSiPadViewController>)iPadViewController;

/**
 *	@brief	Set iPhone container controller.
 *
 *	@param 	viewController 	View controller.
 */
- (void)setIPhoneContainerWithViewController:(UIViewController *)viewController;

/**
 *	@brief	Set iPad container
 *
 *	@param 	view 	Container view
 *	@param 	arrowDirect     Share menu's arrow direction
 */
- (void)setIPadContainerWithView:(UIView *)view
                     arrowDirect:(UIPopoverArrowDirection)arrowDirect;

/**
 *	@brief	Set iPad container
 *
 *	@param 	view 	Container view
 *	@param 	rect 	display rectangle
 *	@param 	arrowDirect 	Share menu's arrow direction
 */
- (void)setIPadContainerWithView:(UIView *)view
                            rect:(CGRect)rect
                     arrowDirect:(UIPopoverArrowDirection)arrowDirect;

/**
 *	@brief	Set iPad container
 *
 *	@param 	buttonItem 	Navigation item or toolbar item.
 *	@param 	arrowDirect 	Share menu's arrow direction
 */
- (void)setIPadContainerWithBarButtonItem:(UIBarButtonItem *)buttonItem
                              arrowDirect:(UIPopoverArrowDirection)arrowDirect;

@end
