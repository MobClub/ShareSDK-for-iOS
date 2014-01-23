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
#import "SS163WeiboUser.h"
#import "SS163WeiboErrorInfo.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method.
 */
typedef enum
{
	SS163WeiboRequestMethodGet = 0, /**< GET方式 */
	SS163WeiboRequestMethodPost = 1, /**< POST方式 */
	SS163WeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SS163WeiboRequestMethod;

/**
 *	@brief	NetEase Weibo App.
 */
@protocol ISS163WeiboApp <ISSPlatformApp>

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
 *	@brief	Call API.
 *
 *	@param 	path 	API path.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SS163WeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Update status.
 *
 *	@param 	status 	Content string.
 *  @param  result  Result handler.
 */
- (void)updateWithStatus:(NSString *)status
                  result:(SSShareResultEvent)result;

/**
 *	@brief	Upload picture.
 *
 *	@param 	pic 	Image attachment.
 *  @param  result  Result handler.
 */
- (void)uploadPic:(id<ISSCAttachment>)pic
           result:(void(^)(BOOL result, NSString *uploadImageUrl, CMErrorInfo *error))result;


@end
