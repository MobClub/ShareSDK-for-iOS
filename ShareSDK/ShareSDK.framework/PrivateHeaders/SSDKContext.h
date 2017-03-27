//
//  SSDKContext.h
//  ShareSDK
//
//  Created by 冯 鸿杰 on 15/2/5.
//  Copyright (c) 2015年 掌淘科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#ifdef __INNER_HEAD__

#import "SSDKTypeDefine.h"

#else

#import <ShareSDK/SSDKTypeDefine.h>

#endif

@class SSDKApplicationDelegate;
@class SSDKAuthSession;
@class SSDKHasAuthSession;
@class SSDKCancelAuthSession;
@class SSDKGetUserInfoSession;
@class SSDKShareSession;

/**
 *  平台标识
 */
extern const NSInteger SSDKPlatform;

/**
 *  服务器版本号
 */
extern const NSInteger SSDKServerVersion;

/**
 *  SDK版本号
 */
extern const NSInteger SSDKClientVersion;

/**
 *  产商
 */
extern NSString *const SSDKFactory;

/**
 *  版本号
 */
extern NSString *const SSDKVersionString;

/**
 *  上下文对象, 用于整个SDK中的配置信息、资源的维护
 */
@interface SSDKContext : NSObject

/**
 *  应用标识
 */
@property (nonatomic, readonly) NSString *appKey;

/**
 *  设备标识
 */
@property (nonatomic, readonly) NSString *deviceKey;

/**
 *  数据开关，用于控制是否与服务器进行数据通讯、统计，默认为YES
 */
@property (nonatomic) BOOL on;

/**
 *  统计设备信息开关
 */
@property (nonatomic, readonly) BOOL statDeviceOn;

/**
 *  统计分享信息开关
 */
@property (nonatomic, readonly) BOOL statShareOn;

/**
 *  统计授权信息开关
 */
@property (nonatomic, readonly) BOOL statAuthOn;

/**
 *  服务器时间戳
 */
@property (nonatomic, readonly) NSTimeInterval timestamp;

/**
 *  运行时间
 */
@property (nonatomic, readonly) NSTimeInterval runDuration;

/**
 *  应用程序委托
 */
@property (nonatomic, weak) id<UIApplicationDelegate> applicationDelegate;

/**
 *  激活平台列表
 */
@property (nonatomic, strong, readonly) NSMutableSet *activePlatformTypes;

/**
 *  UIApplicationDelegate记录列表
 */
@property (nonatomic, strong, readonly) NSMutableArray *applicationDelegateClasses;

/**
 *  用于保存来自ShareContent.xml的内容
 */
@property (nonatomic, readonly) NSString *xmlShareContent;

/**
 *  是否加载了JS脚本
 */
@property (nonatomic, readonly) BOOL isLoadedScript;

/**
 *  本地平台配置信息
 */
@property (nonatomic, strong ,readonly) NSMutableDictionary *platformLocalConfig;

/**
 *  服务器配置信息
 */
@property (nonatomic, strong ,readonly) NSMutableDictionary *platformServerConfig;

/**
 *  文件配置信息
 */
@property (nonatomic, strong ,readonly) NSMutableDictionary *platformXMLConfig;

/**
 *  授权回调
 */
@property (nonatomic, strong) NSMutableDictionary *authCallback;

/**
 *  分享回调
 */
@property (nonatomic, strong) NSMutableDictionary *shareCallback;

/**
 *  检测平台是否支持授权
 *
 *  @param platformType 平台类型
 *
 *  @return YES 支持，NO 不支持
 */
- (BOOL)isSupportAuth:(SSDKPlatformType)platformType;

/**
 *  获取当前授权用户
 *
 *  @param platformType 平台类型
 *
 *  @return 用户信息
 */
- (SSDKUser *)currentUser:(SSDKPlatformType)platformType;

/**
 *  设置当前授权用户
 *
 *  @param user         用户信息
 *  @param platformType 平台类型
 */
- (void)setCurrentUser:(SSDKUser *)user forPlatformType:(SSDKPlatformType)platformType;

/**
 *  注册应用
 *
 *  @param appKey               应用标识
 *  @param activePlatforms      激活平台
 *  @param importHandler        导入事件回调
 *  @param configurationHandler 配置事件回调
 */
- (void)registerApp:(NSString *)appKey
    activePlatforms:(NSArray *)activePlatforms
           onImport:(SSDKImportHandler)importHandler
    onConfiguration:(SSDKConfigurationHandler)configurationHandler;

/**
 *  设置平台XML文件配置
 *
 *  @param appInfo 应用信息
 *  @param type    平台类型
 */
- (void)setPlatformXMLConfig:(NSDictionary *)appInfo
                     forType:(SSDKPlatformType)type;

/**
 *  设置平台本地配置
 *
 *  @param appInfo 应用信息
 *  @param type    平台类型
 */
- (void)setPlatformLocalConfig:(NSDictionary *)appInfo
                       forType:(SSDKPlatformType)type;

/**
 *  设置平台服务器配置
 *
 *  @param appInfo 应用信息
 *  @param type    平台类型
 */
- (void)setPlatformServerConfig:(NSDictionary *)appInfo
                        forType:(SSDKPlatformType)type;

/**
 *  用户授权
 *
 *  @param session 授权会话
 */
- (void)authorize:(SSDKAuthSession *)session;

/**
 *  检测用户是否授权
 *
 *  @param platformType 平台类型
 *  @return YES 表示已授权，NO 表示尚未授权
 */
- (BOOL)hasAuthorized:(SSDKPlatformType)platformType;

/**
 *  取消用户授权
 *
 *  @param platformType 平台类型
 */
- (void)cancelAuthorize:(SSDKPlatformType)platformType;

/**
 *  获取用户信息
 *
 *  @param session 获取用户信息会话
 */
- (void)getUserInfo:(SSDKGetUserInfoSession *)session;

/**
 *  分享信息
 *
 *  @param session 分享会话
 */
- (void)share:(SSDKShareSession *)session;

/**
 *  转化平台类型，对于微信、QQ、易信这些平台其实包含有子平台（如：微信有微信好友、微信朋友圈、微信收藏）。但是初始化时只要统一初始化即可。
 *
 *  @param type 原类型
 *
 *  @return 转化后类型
 */
- (SSDKPlatformType)convertPlatformType:(SSDKPlatformType)type;

/**
 *  监听应用激活通知
 */
- (void)listenAppDidBecomeActiveNotif;

/**
 *  检测是否允许与服务器通讯, 回调中返回YES表示可以使用服务器服务，否则不允许
 *
 *  @param block 返回回调
 */
- (void)checkAllowConnectServer:(void (^) (BOOL allow))block;

/**
 *  获取当前网络类型
 *
 *  @return 网络类型字符串
 */
- (NSString *)currentNetworkType;

/**
 *  获取屏幕分辨率
 *
 *  @return 屏幕分辨率
 */
- (NSString *)screenResolution;

/**
 *  获取本地化字符串
 *
 *  @param key 字符串标识
 *  @param value    默认值
 *
 *  @return 字符串
 */
- (NSString *)localizedString:(NSString *)key defaultValue:(NSString *)value;

/**
 *  获取默认上下文对象
 *
 *  @return 上下文对象
 */
+ (SSDKContext *)defaultContext;

@end
