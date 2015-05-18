//
//  ISSKakaoTalkApp.h
//  KakaoTalkConnection
//
//  Created by @刘靖煌 on 14-7-1.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDK.h>

///#begin zh-cn
/**
 *	@brief	KakaoTalk应用协议
 */
///#end
///#begin en
/**
 *	@brief	KakaoTalk App.
 */
///#end
@protocol ISSKakaoTalkApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief 是否装了KakaoTalk
 *
 *  @return YES 表示
 */
///#end
///#begin en
/**
 *	@brief is KakaoTalk installed
 *
 *  @return YES open success. otherwise open failure.
 */
///#end
- (BOOL)isKakaoTalkInstalled;

///#begin zh-cn
/**
 *	@brief	发送文本消息
 *	@param 	appName 	应用名，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
 *	@param 	appVersion 	应用版本，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
 *	@param 	appBundleID 	appBundleID，默认值[[NSBundle mainBundle] bundleIdentifier]
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send a text message.
 *
 *	@param 	message 	message string.
 *	@param 	appName       the name of applicaiton
 *	@param 	appVersion    the version of application
 *	@param 	appBundleID   the bundle id of applicaiton
 *  @param  result  Result handler.
 */
///#end
- (void)sendMessage:(NSString *)message
            appName:(NSString *)appName
         appVersion:(NSString *)appVersion
        appBundleID:(NSString *)appBundleID
             result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享链接
 *
 *	@param 	url 	链接
 *	@param 	message 	消息
 *	@param 	appName 	应用名，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
 *	@param 	appVersion 	应用版本，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
 *	@param 	appBundleID 	appBundleID，默认值[[NSBundle mainBundle] bundleIdentifier]
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send app information.
 *
 *	@param 	url 	URL string.
 *	@param 	message 	message string.
 *	@param 	appName       the name of applicaiton
 *	@param 	appVersion    the version of application
 *	@param 	appBundleID   the bundle id of applicaiton
 *  @param  result  Result handler.
 */
///#end
- (void)sendURL:(NSString *)url
        message:(NSString *)message
        appName:(NSString *)appName
     appVersion:(NSString *)appVersion
    appBundleID:(NSString *)appBundleID
         result:(SSShareResultEvent)result;

///#begin zh-cn
/**
 *	@brief	分享应用
 *
 *	@param 	message 	消息
 *	@param 	appName 	应用名，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
 *	@param 	appVersion 	应用版本，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
 *	@param 	appBundleID 	appBundleID，默认值[[NSBundle mainBundle] bundleIdentifier]
 *	@param 	iosDownLoadUrl 	iOS版下载地址
 *	@param 	androidDownLoadUrl 	Android版下载地址
 *	@param 	executeUrl 	执行Url：缺少这个参数则会跳转到installurl
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	Send app information.
 *
 *	@param 	message 	message string.
 *	@param 	appName       the name of applicaiton
 *	@param 	appVersion    the version of application
 *	@param 	appBundleID   the bundle id of applicaiton
 *	@param 	iosDownLoadUrl   ios download url
 *	@param 	androidDownLoadUrl   android download url
 *	@param 	executeUrl   excute url
 *  @param  result  Result handler.
 */
///#end
- (void)sendAppWithMessage:(NSString *)message
                   appName:(NSString *)appName
                appVersion:(NSString *)appVersion
               appBundleID:(NSString *)appBundleID
            iosDownLoadUrl:(NSString *)iosDownLoadUrl
        androidDownLoadUrl:(NSString *)androidDownLoadUrl
                executeUrl:(NSString *)executeUrl
                    result:(SSShareResultEvent)result;


@end
