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
#import "SSGooglePlusUser.h"
#import "SSGooglePlusErrorInfo.h"
#import "SSGooglePlusCredential.h"
#import "SSGooglePlusShareInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Google+ request method
 */
typedef enum
{
	SSGooglePlusRequestMethodGet = 0, /**< GET方式 */
	SSGooglePlusRequestMethodPost = 1, /**< POST方式 */
	SSGooglePlusRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSGooglePlusRequestMethod;

/**
 *	@brief	Google+ app protocol
 */
@protocol ISSGooglePlusApp <ISSPlatformApp>

/**
 *	@brief	Get client key.
 *
 *	@return	Client key.
 */
- (NSString *)clientId;

/**
 *	@brief	Get client secret.
 *
 *	@return	Client secret.
 */
- (NSString *)clientSecret;

/**
 *	@brief	Get app redirect url.
 *
 *	@return	Redirect url.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Get SSO callback URL.
 *
 *	@return	callback URL string.
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	Call api.
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters，Can ISSParameter or NSDictionary, (NSDictionary only way to submit POST)
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSGooglePlusRequestMethod)method
     params:(id)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Share content.
 *
 *	@param 	url 	URL string.
 *	@param 	text        Content string.
 *  @param  result  Result handler.
 */
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
              result:(SSShareResultEvent)result;

/**
 *	@brief	Share content.
 *
 *	@param 	url 	URL string.
 *	@param 	text        Content string.
 *  @param  image   Image attachment object.
 *	@param 	deepLinkId  Deep link id.
 *	@param 	title 	Deep link title.
 *	@param 	description 	Deep link description
 *	@param 	thumbnail 	Deep link thumbnail.
 *  @param  result  Result handler.
 */
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
               image:(id<ISSCAttachment>)image
          deepLinkId:(NSString *)deepLinkId
               title:(NSString *)title
         description:(NSString *)description
           thumbnail:(NSString *)thumbnail
              result:(SSShareResultEvent)result;

@end
