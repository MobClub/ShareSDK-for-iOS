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
#import "SSQQErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	QQ App Protocol.
 */
@protocol ISSQQApp <ISSPlatformApp>

/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
- (NSString *)appId;

/**
 *	@brief	Send a text message.
 *
 *	@param 	text 	Content string.
 *  @param  result  Result handler.
 */
- (void)sendText:(NSString *)text
          result:(SSShareResultEvent)result;

/**
 *	@brief	Send a picture message.
 *
 *	@param 	title 	Title string.
 *	@param 	description 	Description.
 *	@param 	pic 	Pictrue attachment object.
 *  @param  result  Result handler.
 */
- (void)sendPic:(NSString *)title
    description:(NSString *)description
            pic:(id<ISSCAttachment>)pic
         result:(SSShareResultEvent)result;

/**
 *	@brief	Send a news message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	url 	URL string.
 *	@param 	pic 	Thumbnail.
 *  @param  result  Result handler.
 */
- (void)sendNews:(NSString *)title
         content:(NSString *)content
             url:(NSString *)url
             pic:(id<ISSCAttachment>)pic
          result:(SSShareResultEvent)result;

/**
 *	@brief	Send a music message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	url 	URL string.
 *	@param 	pic 	Thumbnail.
 *  @param  result  Result handler.
 */
- (void)sendMusic:(NSString *)title
          content:(NSString *)content
              url:(NSString *)url
              pic:(id<ISSCAttachment>)pic
           result:(SSShareResultEvent)result;

/**
 *	@brief	Send a video message.
 *
 *	@param 	title 	Title string.
 *	@param 	content 	Content string.
 *	@param 	url 	URL string.
 *	@param 	pic 	Thumbnail.
 *  @param  result  Result handler.
 */
- (void)sendVideo:(NSString *)title
          content:(NSString *)content
              url:(NSString *)url
              pic:(id<ISSCAttachment>)pic
           result:(SSShareResultEvent)result;


@end
