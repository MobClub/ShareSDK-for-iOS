//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSiPadViewController.h"

/**
 *	@brief	容器对象
 */
@protocol ISSContainer <NSObject>

@required

/**
 *	@brief	获取iPhone视图容器控制器
 *
 *	@return	视图控制器
 */
- (UIViewController *)iPhoneViewController;

/**
 *	@brief	获取iPad视图容器控制器
 *
 *	@return	视图控制器
 */
- (id<ISSiPadViewController>)iPadViewController;

/**
 *	@brief	设置iPhone显示容器
 *
 *	@param 	viewController 	视图控制器
 */
- (void)setIPhoneContainerWithViewController:(UIViewController *)viewController;

/**
 *	@brief	设置iPad显示容器
 *
 *	@param 	view 	视图
 *	@param 	arrowDirect 	显示分享列表方向
 */
- (void)setIPadContainerWithView:(UIView *)view
                     arrowDirect:(UIPopoverArrowDirection)arrowDirect;

/**
 *	@brief	设置iPad显示容器
 *
 *	@param 	view 	视图
 *	@param 	rect 	显示范围
 *	@param 	arrowDirect 	显示分享列表方向
 */
- (void)setIPadContainerWithView:(UIView *)view
                            rect:(CGRect)rect
                     arrowDirect:(UIPopoverArrowDirection)arrowDirect;

/**
 *	@brief	设置iPad显示容器
 *
 *	@param 	buttonItem 	导航按钮
 *	@param 	arrowDirect 	显示分享列表方向
 */
- (void)setIPadContainerWithBarButtonItem:(UIBarButtonItem *)buttonItem
                              arrowDirect:(UIPopoverArrowDirection)arrowDirect;

@end
