//
//  TiktokOpenPlatformApplicationDelegate.h
//
//  Created by TikTok on 2019/7/8.
//  Copyright (c) 2018年 TikTok. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Differentiate whether the app to be communicated is Chinese or international
typedef NS_ENUM(NSInteger, TikTokOpenPlatformAppType) {
    TikTokOpenPlatformAppTypeChina = 0, //!< Communicated is Chinese
    TikTokOpenPlatformAppTypeI18N, //!< Communicated is international
};

/// Mudule Name supported by Tiktok
typedef NS_ENUM(NSInteger, TikTokOpenPlatformModule) {
    TikTokOpenPlatformModuleAuth = 0, //!< Authorization module name
    TikTokOpenPlatformModuleShare, //!< Share module name
};

NS_ASSUME_NONNULL_BEGIN

@protocol TikTokOpenPlatformLogDelegate <NSObject>

/**
 * @brief TikTok internal log in level ERROR or Warning will callback in this method.
 * You need to register log delgate in TiktokOpenPlatformApplicationDelegate
 *
 * @param  logInfo TikTok internal log info.
 *
 */
- (void)tiktokOnLog:(NSString *)logInfo;

@end

@interface TiktokOpenPlatformApplicationDelegate : NSObject

@property (nonatomic, copy, readonly) NSString *currentVersion; //!< TikTok SDK currtent version
@property (nonatomic, weak) id<TikTokOpenPlatformLogDelegate> logDelegate;//!< TikTok internal log delegate

+ (instancetype) sharedInstance;

/**
 * @brief iTunes Url to download Tiktok app.
 *
 * @param appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return iTunes iTunes Url if international it will return empty string
 */
- (NSString *)iTunesUrlWithAppType:(TikTokOpenPlatformAppType)appType;

/**
 * @brief Call when you application delegate receive UIApplication didFinishLaunchingWithOptions
 *
 * @param  application Your singleton app object.
 * @param  launchOptions A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly. For information about the possible keys in this dictionary and how to handle them, see Launch Options Keys.
 *
 */
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions;

/**
 * @brief Call when you application delegate receive OpenURL action
 *
 * @param application Your singleton app object.
 * @param url The URL resource to open. This resource can be a network resource or a file. For information about the Apple-registered URL schemes, see Apple URL Scheme Reference.
 * @param sourceApplication you receive in you App Delegate
 * @param annotation you receive in you App Delegate
 * @return if Tiktok is handle this URL request will return YES
 */
- (BOOL)application:(nullable UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation;

/**
 * @brief If you didn't set you ClientKey in Project.info.plisty you can set it manually.
 *
 * @param  appid The ClientKey you got in TikTok Open platform.
 * @param  appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return register results if success return YES
 */
- (BOOL)registerAppId:(NSString *)appid appType:(TikTokOpenPlatformAppType)appType;

/**
 * @brief Get the ClientKey registed.
 *
 * @param appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return if not registered will return nil
 */
- (nullable NSString *)appIdWithAppType:(TikTokOpenPlatformAppType) appType;

/**
 * @brief The result of target App is installed
 *
 * @param appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return if installed will return YES
 */
- (BOOL)isAppInstalledWithAppType:(TikTokOpenPlatformAppType) appType;

/**
 * @brief The result of target App is supported module
 *
 * @param module the feature SDK provided e.g. TikTokOpenPlatformModuleShare or TikTokOpenPlatformModuleAuth
 * @param appType TikTokOpenPlatformAppTypeChinese or TikTokOpenPlatformAppTypeI18N
 *
 * @return if supported will return YES
 */
- (BOOL)isSupportModule:(TikTokOpenPlatformModule) module appType:(TikTokOpenPlatformAppType)appType;

@end

NS_ASSUME_NONNULL_END
