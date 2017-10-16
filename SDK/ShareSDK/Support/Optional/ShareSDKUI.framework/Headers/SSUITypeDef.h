//
//  SSUITypeDef.h
//  ShareSDKUI
//
//  Created by fenghj on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#ifndef ShareSDKUI_SSUITypeDef_h
#define ShareSDKUI_SSUITypeDef_h
#import <ShareSDK/SSDKImage.h>

@class SSUIShareActionSheetItem;

/**
 *  分享菜单点击事件
 *
 *  @param index    索引
 *  @param item     菜单项
 */
typedef void (^SSUIShareActionSheetItemClickHandler) (NSInteger index, SSUIShareActionSheetItem *item);

/**
 *  分享菜单取消事件
 */
typedef void (^SSUIShareActionSheetCancelHandler) ();

/**
 *  分享内容视图提交事件
 *
 *  @param platforms 将要分享的平台列表
 *  @param content   分享内容
 *  @param image     分享图片
 */
typedef void (^SSUIShareContentEditorViewSubmitHandler) (NSArray *platforms, NSString *content, SSDKImage *image);

/**
 *  分享内容视图取消事件
 */
typedef void (^SSUIShareContentEditorViewCancelHandler) ();

/**
 *	@brief	获取视图宽度
 *
 *	@param 	view 	视图对象
 *
 *	@return	宽度
 */
#define SSUI_WIDTH(view) view.bounds.size.width

/**
 *	@brief	获取视图高度
 *
 *	@param 	view 	视图对象
 *
 *	@return	高度
 */
#define SSUI_HEIGHT(view) view.bounds.size.height

/**
 *	@brief	获取视图原点横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点横坐标
 */
#define SSUI_LEFT(view) view.frame.origin.x

/**
 *	@brief	获取视图原点纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点纵坐标
 */
#define SSUI_TOP(view) view.frame.origin.y

/**
 *	@brief	获取视图右下角横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角横坐标
 */
#define SSUI_RIGHT(view) (SSUI_LEFT(view) + SSUI_WIDTH(view))

/**
 *	@brief	获取视图右下角纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角纵坐标
 */
#define SSUI_BOTTOM(view) (SSUI_TOP(view) + SSUI_HEIGHT(view))


#endif
