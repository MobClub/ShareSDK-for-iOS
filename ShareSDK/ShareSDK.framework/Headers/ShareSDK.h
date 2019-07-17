//
//  ShareSDK.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/5.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SSDKRegister.h"
#import "NSMutableDictionary+SSDKShare.h"
#import "SSDKUser.h"
#import "SSDKCredential.h"
#import "SSDKSession.h"
#import "SSDKImage.h"
#import "SSDKContentEntity.h"
#import "SSDKAuthViewStyle.h"
#import "NSMutableDictionary+SSDKInit.h" //Deprecated

/**
 *  ShareSDK APIs
 */
@interface ShareSDK : NSObject

#pragma mark - 初始化

/**
 ShareSDK 平台注册方法

 @param importHandler 用于设置各平台注册信息，也可在mob管理后台进行注册
 */
+ (void)registPlatforms:(void(^)(SSDKRegister *platformsRegister))importHandler;

#pragma mark - 授权

/**
 授权
 
 @param platformType 平台类型
 @param settings 授权设置,接受scopes属性设置，如新浪微博关注官方微博：@{@"scopes" : @[@"follow_app_official_microblog"]}，类似“follow_app_official_microblog”这些字段是各个社交平台提供的。QQ平台如设置二维码授权,添加字段为QQAuthType：@{@"QQAuthType":@1}, 0为网页账号密码登录授权
 @param stateChangedHandler 授权状态变更回调处理
 @return 会话id
 */
+ (SSDKSession *)authorize:(SSDKPlatformType)platformType
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
+ (void)cancelAuthorize:(SSDKPlatformType)platformType result:(void(^)(NSError *error))result;

#pragma mark - 用户

/**
 获取授权用户信息

 @param platformType 平台类型
 @param stateChangedHandler 状态变更回调处理
 */
+ (SSDKSession *)getUserInfo:(SSDKPlatformType)platformType
              onStateChanged:(SSDKGetUserStateChangedHandler)stateChangedHandler;


#pragma mark - 分享

/**
 分享内容
 
 @param platformType 平台类型
 @param parameters 分享参数
 @param stateChangedHandler 状态变更回调处理
 @return 会话
 */
+ (SSDKSession *)share:(SSDKPlatformType)platformType
            parameters:(NSMutableDictionary *)parameters
        onStateChanged:(SSDKShareStateChangedHandler)stateChangedHandler;


#pragma mark - Deprecated

typedef void(^SSDKImportHandler) (SSDKPlatformType platformType) __deprecated_msg("Discard form v4.2.0");
typedef void(^SSDKConfigurationHandler) (SSDKPlatformType platformType, NSMutableDictionary *appInfo) __deprecated_msg("Discard form v4.2.0");

+ (void)registerActivePlatforms:(NSArray *)activePlatforms
                       onImport:(SSDKImportHandler)importHandler
                onConfiguration:(SSDKConfigurationHandler)configurationHandler __deprecated_msg("Discard form v4.2.0. Use 'registPlatforms:' instead.");

+ (void)cancelAuthorize:(SSDKPlatformType)platformType __deprecated_msg("Discard form v4.2.0. Use 'cancelAuthorize:result:' instead.");
@end
