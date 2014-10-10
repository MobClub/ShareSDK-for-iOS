//
//  ISSKakaoStoryApp.h
//  KakaoStoryConnection
//
//  Created by 刘靖煌 on 14-7-28.
//  Copyright (c) 2014年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import <ShareSDK/ShareSDK.h>

///#begin zh-cn
/**
 *	@brief	ISSKakaoStoryApp应用协议
 */
///#end
///#begin en
/**
 *	@brief	ISSKakaoStoryApp App.
 */
///#end
@protocol ISSKakaoStoryApp <ISSPlatformApp>

///#begin zh-cn
/**
 *	@brief 是否装了KakaoStory
 *
 *  @return YES 表示
 */
///#end
///#begin en
/**
 *	@brief Open KakaoStory
 *
 *  @return YES open success. otherwise open failure.
 */
///#end
- (BOOL)isKakaoStoryInstalled;

///#begin zh-cn
/**
 *	@brief	发送文本消息
 *
 *	@param 	message 	内容
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
 *	@param 	message 	Content string.
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
 *	@brief	分享文件：包括图片、音频和视频等
 *
 *	@param 	fileURL     文件地址
 *	@param 	message 	内容
 *	@param 	title 	图片标题
 *	@param 	desc	图片描述
 *	@param 	image	展示图地址
 *	@param 	appName 	应用名，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
 *	@param 	appVersion 	应用版本，默认值[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
 *	@param 	appBundleID 	appBundleID，默认值[[NSBundle mainBundle] bundleIdentifier]
 *  @param  result  返回回调
 */
///#end
///#begin en
/**
 *	@brief	share file
 *	@param 	fileURL 	file's url
 *	@param 	message 	Content string
 *	@param 	title 	Title string
 *	@param 	desc    description of image
 *	@param 	image      URL of showImage
 *	@param 	appName       the name of applicaiton
 *	@param 	appVersion    the version of application
 *	@param 	appBundleID   the bundle id of applicaiton
 *  @param  result  Result handler.
 */
///#end
- (void)shareWithFile:(NSString *)fileURL
              message:(NSString *)message
                title:(NSString *)title
          description:(NSString *)desc
                image:(id<ISSCAttachment>)imageURL
              appName:(NSString *)appName
           appVersion:(NSString *)appVersion
          appBundleID:(NSString *)appBundleID
               result:(SSShareResultEvent)result;

@end
