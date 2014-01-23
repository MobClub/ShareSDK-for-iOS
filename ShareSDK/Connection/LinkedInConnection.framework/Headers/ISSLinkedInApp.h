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
#import "SSLinkedInUser.h"
#import "SSLinkedInErrorInfo.h"
#import "SSLinkedInCredential.h"
#import "SSLinkedInShare.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	LinkedIn request method
 */
typedef enum
{
	SSLinkedInRequestMethodGet = 0, /**< GET方式 */
	SSLinkedInRequestMethodPost = 1, /**< POST方式 */
	SSLinkedInRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSLinkedInRequestMethod;

@protocol ISSLinkedInApp <ISSPlatformApp>

/**
 *	@brief	Get api key.
 *
 *	@return	Api key.
 */
- (NSString *)apiKey;

/**
 *	@brief	Get secret key.
 *
 *	@return	Secret key.
 */
- (NSString *)secretKey;

/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Call api.
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters, which can be a ISSCParameters protocol object, but also for an NSDictionary object. Be a NSDictionary object is only valid when the POST method to submit.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSLinkedInRequestMethod)method
     params:(id)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Share content.
 *
 *	@param 	comment 	Comment text.
 *	@param 	title 	Title string.
 *	@param 	description 	Content description.
 *	@param 	url 	URL string.
 *	@param 	image 	Image URL string.
 *	@param 	visibility 	Visibility
 *  @param  result  Result handler.
 */
- (void)shareWithComment:(NSString *)comment
                   title:(NSString *)title
             description:(NSString *)description
                     url:(NSString *)url
                   image:(NSString *)image
              visibility:(NSString *)visibility
                  result:(SSShareResultEvent)result;


@end
