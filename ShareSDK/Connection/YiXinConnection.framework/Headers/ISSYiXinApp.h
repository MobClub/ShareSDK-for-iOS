//
//  Created by ShareSDK.cn on 13-1-14.
//  website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDKPlugin.h>
#import "SSYiXinTypeDef.h"

/**
 *	@brief	YiXin App
 */
@protocol ISSYiXinApp <ISSPlatformApp>


/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
- (NSString *)appId;

/**
 *	@brief	Get share scene.
 *
 *	@return	Share scene.
 */
- (SSYiXinScene)scene;

/**
 *	@brief	Set delegate.
 *
 *	@param 	delegate 	Delegate object.
 */
- (void)setDelegate:(id)delegate;

/**
 *	@brief	Send a text message(SSPulishContentMediaTypeText)
 *
 *	@param 	content 	Content string.
 *  @param  result  Result handler.
 */
- (void)sendText:(NSString *)content
          result:(SSShareResultEvent)result;

/**
 *	@brief	Send an image message(SSPulishContentMediaTypeImage)
 *
 *  @param  title   Title string.
 *  @param  description Picture description.
 *  @param  thumbImage  Thumbnail attachment.
 *	@param 	attachment 	Image attachment .
 *  @param  result  Result handler.
 */
- (void)sendImageWithTitle:(NSString *)title
               description:(NSString *)description
                thumbImage:(id<ISSCAttachment>)thumbImage
                attachment:(id<ISSCAttachment>)attachment
                    result:(SSShareResultEvent)result;

/**
 *	@brief	Send a web page message(SSPulishContentMediaTypeNews)
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail attachment.
 *	@param 	url 	URL string.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendNews:(NSString *)title
         content:(NSString *)content
           image:(id<ISSCAttachment>)pic
             url:(NSString *)url
          result:(SSShareResultEvent)result;

/**
 *	@brief	Send a music message(SSPulishContentMediaTypeMusic)
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail attachment.
 *	@param 	url 	URL string.
 *  @param  musicFileUrl    Music file URL string.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendMusic:(NSString *)title
          content:(NSString *)content
            image:(id<ISSCAttachment>)image
              url:(NSString *)url
     musicFileUrl:(NSString *)musicFileUrl
           result:(SSShareResultEvent)result;

/**
 *	@brief	Send a video message(SSPulishContentMediaTypeVideo)
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail attachment.
 *	@param 	url 	URL string.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendVideo:(NSString *)title
          content:(NSString *)content
            image:(id<ISSCAttachment>)image
              url:(NSString *)url
           result:(SSShareResultEvent)result;

/**
 *	@brief	Send an app messge(SSPulishContentMediaTypeApp)
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	pic 	Thumbnail attachment.
 *	@param 	url 	URL string.
 *	@param 	extInfo 	Extended information.
 *	@param 	fileData 	File data.
 *	@param 	scene 	Scene.
 *  @param  result  Result handler.
 */
- (void)sendApp:(NSString *)title
        content:(NSString *)content
          image:(id<ISSCAttachment>)image
            url:(NSString *)url
        extInfo:(NSString *)extInfo
       fileData:(NSData *)fileData
         result:(SSShareResultEvent)result;

@end
