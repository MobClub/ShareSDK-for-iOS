//
//  ShareSDKUI.h
//  ShareSDKUI
//
//  Created by fenghj on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareSDK+SSUI.h"
#import "SSUIShareActionSheetController.h"
#import "SSUIShareContentEditorViewController.h"

@interface ShareSDKUI : NSObject

/**
 *  创建分享菜单
 *
 *  @param items 分享菜单项
 *
 *  @return 分享菜单控制器
 */
+ (SSUIShareActionSheetController *)shareActionSheetWithItems:(NSArray *)items;

/**
 *  创建内容编辑视图
 *
 *  @param content          内容
 *  @param image            图片
 *  @param platformTypes    分享平台列表
 *
 *  @return 内容编辑视图控制器
 */
+ (SSUIShareContentEditorViewController *)contentEditorViewWithContent:(NSString *)content
                                                                 image:(SSDKImage *)image
                                                         platformTypes:(NSArray *)platformTypes;

@end
