//
//  SSShareActionSheetCustomItem.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 13-2-21.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSShareActionSheetItem.h"
#import "ShareSDKEventHandlerDef.h"

/**
 *	@brief	自定义分享菜单项
 */
@interface SSShareActionSheetCustomItem : NSObject <ISSShareActionSheetItem>
{
@private
    NSString *_title;
    UIImage *_icon;
    SSShareActionSheetItemClickHandler _clickHandler;
}

/**
 *	@brief	标题
 */
@property (nonatomic,readonly) NSString *title;

/**
 *	@brief	图标
 */
@property (nonatomic,readonly) UIImage *icon;

/**
 *	@brief	点击事件处理器
 */
@property (nonatomic,readonly) SSShareActionSheetItemClickHandler clickHandler;

/**
 *	@brief	初始化自定义菜单项
 *
 *	@param 	title 	标题
 *	@param 	icon 	图标
 *	@param 	clickHandler 	点击事件处理
 *
 *	@return	自定义菜单项
 */
- (id)initWithTitle:(NSString *)title
               icon:(UIImage *)icon
       clickHandler:(SSShareActionSheetItemClickHandler)clickHandler;



@end
