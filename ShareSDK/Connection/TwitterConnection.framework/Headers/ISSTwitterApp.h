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
#import "SSTwitterUser.h"
#import "SSTwitterErrorInfo.h"
#import "SSTwitterTweets.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Twitter Request Method.
 */
typedef enum
{
	SSTwitterRequestMethodGet = 0, /**< GET方式 */
	SSTwitterRequestMethodPost = 1, /**< POST方式 */
	SSTwitterRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTwitterRequestMethod;

/**
 *	@brief	Twitter App Protocol.
 */
@protocol ISSTwitterApp <ISSPlatformApp>

/**
 *	@brief	Get consumer key.
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
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSTwitterRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Update status.
 *
 *	@param 	status 	Content string.
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
- (void)updateWithStatus:(NSString *)status
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;

/**
 *	@brief	Update status.
 *
 *	@param 	status 	Content string.
 *	@param 	media 	Media information.
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
- (void)updateWithStatus:(NSString *)status
                   media:(id<ISSCAttachment>)media
      locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                  result:(SSShareResultEvent)result;


@end
