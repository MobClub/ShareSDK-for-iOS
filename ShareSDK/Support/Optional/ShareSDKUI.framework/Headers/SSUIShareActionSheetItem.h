//
//  SSUIShareActionSheetItem.h
//  ShareSDKUI
//
//  Created by fenghj on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

/**
 *  分享菜单项
 */
@interface SSUIShareActionSheetItem : UIControl
{
    UIImage *_icon;
    NSString *_label;
}

/**
 *  图标
 */
@property (nonatomic, strong) UIImage *icon;

/**
 *  标签
 */
@property (nonatomic, copy) NSString *label;

/**
 *  创建平台分享菜单项
 *
 *  @param platformType 平台类型
 *  @param index 数组下标
 *
 *  @return 分享菜单项
 */
+ (instancetype)itemWithPlatformType:(SSDKPlatformType)platformType;

/**
 *  创建自定义分享菜单项
 *
 *  @param icon         图标
 *  @param label        标签
 *  @param clickHandler 点击事件处理
 *
 *  @return 分享菜单项
 */
+ (instancetype)itemWithIcon:(UIImage *)icon label:(NSString *)label onClick:(void(^)())clickHandler;

@end
