//
//  ShareSDK.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/5.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableDictionary+SSDKInit.h"
#import "NSMutableDictionary+SSDKShare.h"
#import "SSDKTypeDefine.h"
#import "SSDKUserQueryConditional.h"
#import "SSDKCredential.h"
#import "SSDKAuthViewStyle.h"
#import "SSDKUser.h"

/**
 *  ShareSDK APIs
 */
@interface ShareSDK : NSObject

#pragma mark - 初始化

/**
 *  初始化ShareSDK应用
 *
 *  @param activePlatforms          使用的分享平台集合，如:@[@(SSDKPlatformTypeSinaWeibo), @(SSDKPlatformTypeTencentWeibo)];
 *  @param importHandler           导入回调处理，当某个平台的功能需要依赖原平台提供的SDK支持时，需要在此方法中对原平台SDK进行导入操作。具体的导入方式可以参考ShareSDKConnector.framework中所提供的方法。
 *  @param configurationHandler     配置回调处理，在此方法中根据设置的platformType来填充应用配置信息
 */
+ (void)registerActivePlatforms:(NSArray *)activePlatforms
                       onImport:(SSDKImportHandler)importHandler
                onConfiguration:(SSDKConfigurationHandler)configurationHandler;

#pragma mark - 授权

/**
 *  分享平台授权
 *
 *  @param platformType       平台类型
 *  @param settings    授权设置,目前只接受SSDKAuthSettingKeyScopes属性设置，如新浪微博关注官方微博：@{SSDKAuthSettingKeyScopes : @[@"follow_app_official_microblog"]}，类似“follow_app_official_microblog”这些字段是各个社交平台提供的。
 *  @param stateChangedHandler 授权状态变更回调处理
 */
+ (void)authorize:(SSDKPlatformType)platformType
         settings:(NSDictionary *)settings
   onStateChanged:(SSDKAuthorizeStateChangedHandler)stateChangedHandler;

/**
 *  判断分享平台是否授权
 *
 *  @param platformTypem 平台类型
 *  @return YES 表示已授权，NO 表示尚未授权
 */
+ (BOOL)hasAuthorized:(SSDKPlatformType)platformTypem;

/**
 *  取消分享平台授权
 *
 *  @param platformType  平台类型
 */
+ (void)cancelAuthorize:(SSDKPlatformType)platformType;

#pragma mark - 用户

/**
 *  获取授权用户信息
 *
 *  @param platformType       平台类型
 *  @param stateChangedHandler 状态变更回调处理
 */
+ (void)getUserInfo:(SSDKPlatformType)platformType
     onStateChanged:(SSDKGetUserStateChangedHandler)stateChangedHandler;

/**
 *  获取用户信息
 *
 *  @param platformType       平台类型
 *  @param conditional        查询条件，如果为nil则获取当前授权用户信息
 *  @param stateChangedHandler 状态变更回调处理
 */
+ (void)getUserInfo:(SSDKPlatformType)platformType
        conditional:(SSDKUserQueryConditional *)conditional
     onStateChanged:(SSDKGetUserStateChangedHandler)stateChangedHandler;

#pragma mark - 分享

/**
 *  分享内容
 *
 *  @param platformType             平台类型
 *  @param parameters               分享参数
 *  @param stateChangedHandler       状态变更回调处理
 */
+ (void)share:(SSDKPlatformType)platformType
   parameters:(NSMutableDictionary *)parameters
onStateChanged:(SSDKShareStateChangedHandler)stateChangedHandler;

@end
