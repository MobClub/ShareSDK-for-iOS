//
//  ShareSDK+SSUI.h
//  ShareSDKUI
//
//  Created by fenghj on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>
#import "SSUIShareActionSheetController.h"
#import "SSUIShareContentEditorViewController.h"

/**
 *  分享状态变更
 *
 *  @param state         返回状态
 *  @param platformType  平台类型
 *  @param userData      用户数据
 *  @param contentEntity 分享内容实体
 *  @param error         错误信息
 *  @param end           是否已经结束本次分享标识
 */
typedef void (^SSUIShareStateChangedHandler) (SSDKResponseState state,
                                              SSDKPlatformType platformType,
                                              NSDictionary *userData,
                                              SSDKContentEntity *contentEntity,
                                              NSError *error,
                                              BOOL end);

@interface ShareSDK (SSUI)

/**
 *  显示分享菜单
 *
 *  @param view                     要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图
 *  @param items                    菜单项，如果传入nil，则显示已集成的平台列表
 *  @param shareParams              分享内容参数
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 分享菜单控制器
 */
+ (SSUIShareActionSheetController *)showShareActionSheet:(UIView *)view
                                                   items:(NSArray *)items
                                             shareParams:(NSMutableDictionary *)shareParams
                                     onShareStateChanged:(SSUIShareStateChangedHandler)shareStateChangedHandler;

/**
 *  显示内容编辑视图
 *
 *  @param platformType             分享的平台类型
 *  @param otherPlatformTypes       除分享平台外，还可以分享的平台类型。
 *  @param shareParams              分享内容参数
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 内容编辑视图控制器
 */
+ (SSUIShareContentEditorViewController *)showShareEditor:(SSDKPlatformType)platformType
                                        otherPlatformTypes:(NSArray *)otherPlatformTypes
                                              shareParams:(NSMutableDictionary *)shareParams
                                      onShareStateChanged:(SSUIShareStateChangedHandler)shareStateChangedHandler;

/**
 *  根据配置文件显示分享菜单
 *
 *  @param view                     要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图
 *  @param items                    菜单项，如果传入nil，则显示已集成的平台列表
 *  @param contentName              ShareContent.xml内<Content>标签name属性的值
 *  @param customFields             自定义字段
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 分享菜单控制器
 */
+ (SSUIShareActionSheetController *)showShareActionSheet:(UIView *)view
                                                   items:(NSArray *)items
                                             contentName:(NSString *)contentName
                                            customFields:(NSDictionary *)customFields
                                     onShareStateChanged:(SSUIShareStateChangedHandler)shareStateChangedHandler;

/**
 *  根据配置文件显示内容编辑视图
 *
 *  @param platformType             分享的平台类型
 *  @param otherPlatformTypes       除分享平台外，还可以分享的平台类型。
 *  @param contentName              ShareContent.xml内<Content>标签name属性的值
 *  @param customFields             自定义字段
 *  @param shareStateChangedHandler 分享状态变更事件
 *
 *  @return 内容编辑视图控制器
 */
+ (SSUIShareContentEditorViewController *)showShareEditor:(SSDKPlatformType)platformType
                                       otherPlatformTypes:(NSArray *)otherPlatformTypes
                                              contentName:(NSString *)contentName
                                             customFields:(NSDictionary *)customFields
                                      onShareStateChanged:(SSUIShareStateChangedHandler)shareStateChangedHandler;

/**
 *  设置支持的页面方向
 */
+ (void)setSupportedInterfaceOrientation:(UIInterfaceOrientationMask)toInterfaceOrientation;

@end
