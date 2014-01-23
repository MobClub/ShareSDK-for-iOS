//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "SSWeChatErrorInfo.h"
#import "SSWeChatTypeDef.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	WeChat App.
 */
@protocol ISSWeChatApp <ISSPlatformApp>

/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
- (NSString *)appId;

/**
 *	@brief	Get a share scene.
 *
 *	@return	Share scene.
 */
- (SSWeChatScene)scene;

/**
 *	@brief	Set a delegate.
 *
 *	@param 	delegate 	Delegate object.
 */
- (void)setDelegate:(id)delegate;

/**
 *	@brief	Send a text message.
 *
 *	@param 	content 	Content string.
 *	@param 	scene 	Scene
 *  @param  result  Result handler.
 */
- (void)sendText:(NSString *)content
          result:(SSShareResultEvent)result;

/**
 *	@brief	Send a picture message.
 *
 *  @param  title   Title string.
 *  @param  description     Picture description.
 *  @param  thumbPic    Thumbnail.
 *	@param 	pic 	Picture attachment.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendPic:(NSString *)title
    description:(NSString *)description
       thumbPic:(id<ISSCAttachment>)thumbPic
            pic:(id<ISSCAttachment>)pic
         result:(SSShareResultEvent)result;

/**
 *	@brief	Send a new message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail.
 *	@param 	url 	URL string.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendNews:(NSString *)title
         content:(NSString *)content
             pic:(id<ISSCAttachment>)pic
             url:(NSString *)url
          result:(SSShareResultEvent)result;

/**
 *	@brief	Send a music message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail.
 *	@param 	url 	URL string.
 *  @param  musicFileUrl    Music file URL.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendMusic:(NSString *)title
          content:(NSString *)content
              pic:(id<ISSCAttachment>)pic
              url:(NSString *)url
     musicFileUrl:(NSString *)musicFileUrl
           result:(SSShareResultEvent)result;

/**
 *	@brief	Send a video message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail.
 *	@param 	url 	URL string.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendVideo:(NSString *)title
          content:(NSString *)content
              pic:(id<ISSCAttachment>)pic
              url:(NSString *)url
           result:(SSShareResultEvent)result;

/**
 *	@brief	Send app information.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail
 *	@param 	url 	URL string.
 *	@param 	extInfo 	Extended information.
 *	@param 	fileData 	File data.
 *	@param 	scene 	Scene
 *  @param  result  Result handler.
 */
- (void)sendApp:(NSString *)title
        content:(NSString *)content
            pic:(id<ISSCAttachment>)pic
            url:(NSString *)url
        extInfo:(NSString *)extInfo
       fileData:(NSData *)fileData
         result:(SSShareResultEvent)result;

/**
 *	@brief	Send a Non-GIF image.
 *
 *	@param 	pic 	Thumbnail
 *	@param 	emoticonData 	Image data
 *  @param  result  Result handler.
 */
- (void)sendNonGif:(id<ISSCAttachment>)pic
      emoticonData:(NSData *)emoticonData
            result:(SSShareResultEvent)result;

/**
 *	@brief	Send a GIF image.
 *
 *	@param 	pic 	Thumbnail
 *	@param 	emoticonData 	Image data.
 *  @param  result  Result handler.
 */
- (void)sendGif:(id<ISSCAttachment>)pic
   emoticonData:(NSData *)emoticonData
         result:(SSShareResultEvent)result;


@end
