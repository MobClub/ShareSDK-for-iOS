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
 *	@brief	iPad视图控制器协议，用于描述iPad中显示容器
 */
@protocol ISSiPadViewController <NSObject>

/**
 *	@brief	获取视图,表示弹出菜单显示在哪一个视图上
 *
 *  @return 视图对象
 */
- (UIView *)view;

/**
 *	@brief	设置视图
 *
 *	@param 	view 	视图对象
 */
- (void)setView:(UIView *)view;

/**
 *	@brief	获取按钮项，表示弹出菜单用于显示在哪一个导航按钮上
 *
 *  @return 按钮项对象
 */
- (UIBarButtonItem *)buttonItem;

/**
 *	@brief	设置按钮项
 *
 *	@param 	buttonItem 	按钮项对象
 */
- (void)setButtonItem:(UIBarButtonItem *)buttonItem;

/**
 *	@brief	获取菜单方向
 *
 *	@return	菜单方向
 */
- (UIPopoverArrowDirection)arrowDirection;

/**
 *	@brief	设置菜单方向
 *
 *	@param 	arrowDirection 	菜单方向
 */
- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection;

/**
 *	@brief	获取容器显示区域
 *
 *	@return	区域对象
 */
- (CGRect)rect;

/**
 *	@brief	设置容器显示区域
 *
 *	@param 	rect 	区域对象
 */
- (void)setRect:(CGRect)rect;

@end
