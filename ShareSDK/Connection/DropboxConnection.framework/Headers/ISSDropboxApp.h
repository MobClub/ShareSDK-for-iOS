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
#import "SSDropboxUser.h"
#import "SSDropboxErrorInfo.h"
#import "SSDropboxCredential.h"
#import "SSDropboxFile.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request Method.
 */
typedef enum
{
	SSDropboxRequestMethodGet = 0, /**< GET方式 */
	SSDropboxRequestMethodPost = 1, /**< POST方式 */
	SSDropboxRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSDropboxRequestMethod;

/**
 *	@brief	Dropbox app protocol
 */
@protocol ISSDropboxApp <ISSPlatformApp>

/**
 *	@brief	Get Consumer key
 *
 *	@return	Consumer key.
 */
- (NSString *)consumerKey;

/**
 *	@brief	Get consumer secret.
 *
 *	@return	Consumer secret.
 */
- (NSString *)consumerSecret;

/**
 *	@brief	Call api
 *
 *	@param 	path 	Api path.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler
 *  @param  fault   Fault handler
 */
- (void)api:(NSString *)path
     method:(SSDropboxRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Upload file
 *
 *	@param 	file 	File attachment object.
 */
- (void)uploadFile:(id<ISSCAttachment>)file
            result:(SSShareResultEvent)result;

@end
