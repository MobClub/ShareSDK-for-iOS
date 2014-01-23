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
#import "SSRenRenUser.h"
#import "SSRenRenErrorInfo.h"
#import "SSRenRenPost.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method.
 */
typedef enum
{
	SSRenRenRequestMethodGet = 0, /**< GET方式 */
	SSRenRenRequestMethodPost = 1, /**< POST方式 */
	SSRenRenRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSRenRenRequestMethod;

/**
 *	@brief	RenRen App
 */
@protocol ISSRenRenApp <ISSPlatformApp>

/**
 *	@brief	Get app id.
 *
 *	@return	App id.
 */
- (NSString *)appId;

/**
 *	@brief	Get app key.
 *
 *	@return	App key.
 */
- (NSString *)appKey;

/**
 *	@brief	Get app secret.
 *
 *	@return	App secret.
 */
- (NSString *)appSecret;

/**
 *	@brief	Get SSO callback URL.
 *
 *	@return	SSO callback URL.
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
     method:(SSRenRenRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Upload image
 *
 *	@param 	file 	File attachment.
 *	@param 	description 	image description。Can not exceed 200 characters
 *	@param 	albumId 	Album ID, albumId omitted when the meeting reached the application album
 */
- (void)uploadPhoto:(id<ISSCAttachment>)file
        description:(NSString *)description
            albumId:(NSNumber *)albumId
             result:(void(^)(BOOL result, id photo, CMErrorInfo *error))result;

/**
 *	@brief	Publish feed.
 *
 *	@param 	name 	Title. Up to 30 characters
 *	@param 	description 	New to main content。 Note: Up to 200 characters.
 *	@param 	url 	新鲜事标题和图片指向的链接。
 *	@param 	message 	用户输入的自定义内容。注意：最多200个字符。
 *	@param 	image 	新鲜事图片地址
 *	@param 	caption 	新鲜事副标题 注意：最多20个字符
 */
- (void)publishFeedWithName:(NSString *)name
                description:(NSString *)description
                        url:(NSString *)url
                    message:(NSString *)message
                      image:(NSString *)image
                    caption:(NSString *)caption
                     result:(SSShareResultEvent)result;

@end
