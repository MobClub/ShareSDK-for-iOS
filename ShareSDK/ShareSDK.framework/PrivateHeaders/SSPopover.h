//
//  SSPopover.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 13-4-10.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __SHARESDK_HEADER__
#import "ISSShareActionSheet.h"
#import "ISSContainer.h"
#else
#import "../Headers/ISSShareActionSheet.h"
#import "../Headers/ISSContainer.h"
#endif

typedef void(^itemClickHandlerBlock)(ShareType);

/**
 *	@brief	弹出窗口管理器
 */
@interface SSPopover : NSObject <ISSShareActionSheet,
                                 UIPopoverControllerDelegate>
{
@private
    UIPopoverController *_containerController;
    id<ISSContainer> _container;
    BOOL _hasItemClick;                 //如果已经点击列表项则为YES,用于判断是取消选择还是选择列表项。
    NSArray *_shareList;
//    id _clickHandler;
    itemClickHandlerBlock _clickHandler;
    
    id _cancelHandler;
    BOOL _retainSelf;
    id _item;
}

/**
 *	@brief	初始化弹出窗口管理器
 *
 *	@param 	shareList 	分享列表
 *
 *	@return	弹出窗口管理器对象
 */
- (id)initWithShareList:(NSArray *)shareList
           clickHandler:(void(^)(ShareType type))clickHandler
          cancelHandler:(void(^)())cancelHandler;


@end
