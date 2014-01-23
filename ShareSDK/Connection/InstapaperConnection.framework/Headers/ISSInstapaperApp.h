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
#import "SSInstapaperUser.h"
#import "SSInstapaperErrorInfo.h"
#import "SSInstapaperBookmark.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Instapaper Request Method.
 */
typedef enum
{
	SSInstapaperRequestMethodGet = 0, /**< GET方式 */
	SSInstapaperRequestMethodPost = 1, /**< POST方式 */
	SSInstapaperRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSInstapaperRequestMethod;

/**
 *	@brief	Instapaper App.
 */
@protocol ISSInstapaperApp <ISSPlatformApp>

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
     method:(SSInstapaperRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Add a bookmark.
 *
 *	@param 	url 	URL string.
 *	@param 	title 	Title string.
 *	@param 	description 	Description.
 *	@param 	folderId 	Folder id.
 *	@param 	resolveFinalUrl 	Solve the problem of identifying the final URL, enabled by default, to solve the problem of the jump page, set to NO then said they did not jump
 *	@param 	isPrivateFromSource 	whether private from source.
 *	@param 	content 	Corresponds to the complete contents of the specified URL, allowing identification with HTML, for display in the Instapaper server can not crawl content.
 *  @param  result      Result handler.
 */
- (void)addBookmark:(NSString *)url
              title:(NSString *)title
        description:(NSString *)description
           folderId:(NSInteger)folderId
    resolveFinalUrl:(NSInteger)resolveFinalUrl
isPrivateFromSource:(NSString *)isPrivateFromSource
            content:(NSString *)content
             result:(SSShareResultEvent)result;


@end
