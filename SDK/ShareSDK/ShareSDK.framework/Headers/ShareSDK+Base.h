//
//  ShareSDK+Base.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/6.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>
#import "ISSDKAuthView.h"

/**
 *  ShareSDK基础APIs
 */
@interface ShareSDK (Base)

/**
 *  获取SDK版本
 *
 *  @return 版本号
 */
+ (NSString *)sdkVer;

/**
 *  获取激活的平台列表
 *
 *  @return 平台列表
 */
+ (NSArray *)activePlatforms;

/**
 *  检测平台是否支持授权
 *
 *  @param platformType 平台类型
 *
 *  @return YES 支持，NO 不支持
 */
+ (BOOL)isSupportAuth:(SSDKPlatformType)platformType;

/**
 *  获取当前授权用户
 *
 *  @param platformType 平台类型
 *
 *  @return 用户信息
 */
+ (SSDKUser *)currentUser:(SSDKPlatformType)platformType;

/**
 *  设置当前授权用户
 *
 *  @param user         用户信息
 *  @param platformType 平台类型
 */
+ (void)setCurrentUser:(SSDKUser *)user forPlatformType:(SSDKPlatformType)platformType;

/**
 *  分享平台授权
 *
 *  @param platformType         平台类型
 *  @param settings             授权设置
 *  @param viewDisplayHandler   授权视图显示回调处理，当授权时需要在应用中显示授权时触发此回调（即SSO授权此回调不触发）
 *  @param stateChangedHandler   授权状态变更回调处理
 */
+ (void)authorize:(SSDKPlatformType)platformType
         settings:(NSDictionary *)settings
    onViewDisplay:(SSDKAuthorizeViewDisplayHandler)viewDisplayHandler
   onStateChanged:(SSDKAuthorizeStateChangedHandler)stateChangedHandler;

/**
 *  获取授权用户信息
 *
 *  @param platformType         平台类型
 *  @param conditional          查询条件
 *  @param authorizeHandler     授权处理器
 *  @param stateChangedHandler   状态变更回调处理
 */
+ (void)getUserInfo:(SSDKPlatformType)platformType
        conditional:(SSDKUserQueryConditional *)conditional
        onAuthorize:(SSDKNeedAuthorizeHandler)authorizeHandler
      onStateChanged:(SSDKGetUserStateChangedHandler)stateChangedHandler;

/**
 *  分享内容
 *
 *  @param platformType             平台类型
 *  @param parameters               分享参数
 *  @param authorizeHandler   授权处理器
 *  @param stateChangedHandler       状态变更回调处理
 */
+ (void)share:(SSDKPlatformType)platformType
   parameters:(NSMutableDictionary *)parameters
  onAuthorize:(SSDKNeedAuthorizeHandler)authorizeHandler
onStateChanged:(SSDKShareStateChangedHandler)stateChangedHandler;


/**
 分享事件记录

 @param platformType 分享平台
 @param eventType 分享事件类型
 */
+ (void)recordShareEventWithPlatform:(SSDKPlatformType)platformType eventType:(SSDKShareEventType)eventType;

/**
 是否开启sdk自动统计意向分享事件

 @param record YES:开启 NO:关闭
 */
+ (void)enableAutomaticRecordingEvent:(BOOL)record;

@end
