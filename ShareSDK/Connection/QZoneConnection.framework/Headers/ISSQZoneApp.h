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
#import "SSQZoneUser.h"
#import "SSQZoneErrorInfo.h"
#import "SSQZoneShareInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method
 */
typedef enum
{
	SSQZoneRequestMethodGet = 0, /**< GET方式 */
	SSQZoneRequestMethodPost = 1, /**< POST方式 */
	SSQZoneRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSQZoneRequestMethod;

/**
 *	@brief	QZone App.
 */
@protocol ISSQZoneApp <ISSPlatformApp>

/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
- (NSString *)appKey;

/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
- (NSString *)appId;

/**
 *	@brief	Get SSO callback URL address.
 *
 *	@return	SSO callback url address.
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSQZoneRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Upload picture.
 *
 *	@param 	pic 	Picture attachment object.
 *	@param 	desc 	Description.
 *	@param 	title 	Title string.
 *	@param 	albumid 	Album ID，The default is nil indicates album
 */
- (void)uploadPic:(id<ISSCAttachment>)pic
             desc:(NSString *)desc
            title:(NSString *)title
          albumid:(NSString *)albumid
           result:(void(^)(BOOL result, id image, CMErrorInfo *error))result;

/**
 *	@brief	Add share information.
 *
 *	@param 	title 	Title, the longest 36 characters, the excess will be truncated.
 *	@param 	url 	Sharing website where links to resources, click after the jump to a third party website
 *	@param 	site 	Site name when sharing the source site, please fill out the application access to registration site name.
 *	@param 	fromUrl 	Shared source site corresponding website address url
 *	@param 	comment 	User Content, the longest 40 characters, the excess will be truncated.
 *	@param 	summary 	Summary of content sharing web resources, or a summary description of the page, the longest 80 characters, the excess will be truncated.
 *	@param 	images 	Representative image links shared web resources.
 *	@param 	type 	Share types of content. 4 indicate that the page; 5 shows a video (type = 5, you must pass playurl).
 *	@param 	playUrl 	Length is limited to 256 bytes. Type = 5 only when effective, which means that the video playback swf address.
 *	@param 	nswb 	A value of 1, which means that the default is not synchronized to Tencent Weibo, other values ​​or do not pass this parameter indicates the default synchronized to Tencent Weibo.
 *  @param  result  Result handler.
 */
- (void)addShareWithTitle:(NSString *)title
                      url:(NSString *)url
                     site:(NSString *)site
                  fromUrl:(NSString *)fromUrl
                  comment:(NSString *)comment
                  summary:(NSString *)summary
                   images:(NSArray *)images
                     type:(NSNumber *)type
                  playUrl:(NSString *)playUrl
                     nswb:(NSNumber *)nswb
                   result:(SSShareResultEvent)result;

/**
 *	@brief	Send story.
 *
 *	@param 	title 	Title string.
 *	@param 	description 	Description.
 *	@param 	shareUrl 	Share url.
 *	@param 	pics 	a image list.
 *	@param 	summary 	Summary string.
 *	@param 	url 	URL string.
 *	@param 	act 	Default is “进入应用”
 *	@param 	result 	Result handler.
 */
- (void)sendStoryWithTitle:(NSString *)title
               description:(NSString *)description
                  shareUrl:(NSString *)shareUrl
                      pics:(NSArray *)pics
                   summary:(NSString *)summary
                       url:(NSString *)url
                       act:(NSString *)act
                    result:(SSShareResultEvent)result;



@end
