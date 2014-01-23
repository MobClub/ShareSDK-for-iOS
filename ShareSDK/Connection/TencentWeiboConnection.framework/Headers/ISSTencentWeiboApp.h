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
#import "SSTencentWeiboUser.h"
#import "SSTencentWeiboErrorInfo.h"
#import "SSTencentWeiboTweet.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method.
 */
typedef enum
{
	SSTecentWeiboRequestMethodGet = 0, /**< GET方式 */
	SSTecentWeiboRequestMethodPost = 1, /**< POST方式 */
	SSTecentWeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTecentWeiboRequestMethod;

/**
 *	@brief	Tencent Weibo App Protocol.
 */
@protocol ISSTencentWeiboApp <ISSPlatformApp>

/**
 *	@brief	Get app key.
 *
 *	@return	app key.
 */
- (NSString *)appKey;

/**
 *	@brief	Get app secret.
 *
 *	@return	app secret.
 */
- (NSString *)appSecret;

/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Get SSO callback URL.
 *
 *	@return	SSO callback URL.
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path.
 *  @param  method  Request method.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized user
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSTecentWeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Send a Tweet.
 *
 *	@param 	content 	Content string.
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
- (void)addTweetWithContent:(NSString *)content
         locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                     result:(SSShareResultEvent)result;

/**
 *	@brief	send a picture Tweet.
 *
 *	@param 	content 	Content string.
 *	@param 	pic 	Picture attachment.
 *  @param  locationCoordinate  Location coordinate.
 *  @param  result  Result handler.
 */
- (void)addPicTweetWithContent:(NSString *)content
                           pic:(id<ISSCAttachment>)pic
            locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                        result:(SSShareResultEvent)result;

/**
 *	@brief	send a picture Tweet with picture URL.
 *
 *	@param 	content 	Content string.
 *	@param 	url 	Image URL address, must begin with http.
 *  @param  locationCoordinate  Location information, which can be nil
 *  @param  result  Result handler.
 */
- (void)addPicUrlTweetWithContent:(NSString *)content
                              url:(NSString *)url
               locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                           result:(SSShareResultEvent)result;

/**
 *	@brief	Get Tweet information.
 *
 *	@param 	tweetId 	Tweet id.
 *  @param  result      Result handler.
 */
- (void)getTweetWithId:(NSString *)tweetId
                result:(void(^)(BOOL result, id<ISSPlatformShareInfo> tweet, CMErrorInfo *error))result;


@end
