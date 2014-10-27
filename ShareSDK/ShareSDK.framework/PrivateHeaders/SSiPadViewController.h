//
//  SSiPadViewController.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 13-4-8.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __SHARESDK_HEADER__
#import "ISSiPadViewController.h"
#else
#import "../Headers/ISSiPadViewController.h"
#endif

/**
 *	@brief	iPad视图控制器
 */
@interface SSiPadViewController : NSObject <ISSiPadViewController>
{
@private
    UIView *_view;
    UIBarButtonItem *_buttonItem;
    UIPopoverArrowDirection _arrowDirection;
    CGRect _rect;
}

/**
 *	@brief	视图
 */
@property (nonatomic,retain) UIView *view;

/**
 *	@brief	按钮项
 */
@property (nonatomic,retain) UIBarButtonItem *buttonItem;

/**
 *	@brief	菜单方向
 */
@property (nonatomic) UIPopoverArrowDirection arrowDirection;

/**
 *	@brief	显示区域
 */
@property (nonatomic) CGRect rect;

@end
