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
#import "SSDouBanUser.h"
#import "SSDouBanErrorInfo.h"
#import "SSDouBanStatus.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	DouBan request method
 */
typedef enum
{
	SSDouBanRequestMethodGet = 0, /**< GET方式 */
	SSDouBanRequestMethodPost = 1, /**< POST方式 */
	SSDouBanRequestMethodMultipartPost = 2, /**< Multipart POST方式，用于上传文件的api接口 */
    SSDouBanRequestMethodDelete = 3 /**< DELETE方式 */
}
SSDouBanRequestMethod;

/**
 *	@brief	DouBan app protocol
 */
@protocol ISSDouBanApp <ISSPlatformApp>

/**
 *	@brief	Get app key
 *
 *	@return	app key
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
 *	@brief	Call api
 *
 *	@param 	path 	Path string.
 *	@param 	params 	Request parameters.
 *  @param  user    User object,If the incoming nil indicates the default authorized users
 *  @param  result  result handler.
 *  @param  fault   fault handler.
 */
- (void)api:(NSString *)path
     method:(SSDouBanRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Add Status
 *
 *	@param 	text 	Content string.
 *	@param 	image 	Image attachment object.
 *	@param 	recTitle 	Recommended URL title
 *	@param 	recUrl 	Recommended URL href
 *	@param 	recDesc 	Recommended URL description
 *	@param 	recImage 	Recommended URL image url.
 *  @param  result  result handler.
 */
- (void)addStatusWithText:(NSString *)text
                    image:(id<ISSCAttachment>)image
                 recTitle:(NSString *)recTitle
                   recUrl:(NSString *)recUrl
                  recDesc:(NSString *)recDesc
                 recImage:(NSString *)recImage
                   result:(SSShareResultEvent)result;

/**
 *	@brief	Get Status info.
 *
 *	@param 	statusId 	Status id.
 */
- (void)getStatusWithId:(NSString *)statusId
                 result:(void(^)(BOOL result, id status, CMErrorInfo *error))result;



@end
