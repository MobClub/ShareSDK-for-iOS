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
#import "SSSohuUser.h"
#import "SSSohuErrorInfo.h"
#import "SSSohuBookmark.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Sohu Request Method
 */
typedef enum
{
	SSSohuRequestMethodGet = 0, /**< GET方式 */
	SSSohuRequestMethodPost = 1, /**< POST方式 */
	SSSohuRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSSohuRequestMethod;

/**
 *	@brief	Sohu App Protocol.
 */
@protocol ISSSohuApp <ISSPlatformApp>

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
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSSohuRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Add a bookmark.
 *
 *	@param 	url 	URL string.
 *  @param  result  Result handler.
 */
- (void)addBookmark:(NSString *)url
             result:(SSShareResultEvent)result;


@end
