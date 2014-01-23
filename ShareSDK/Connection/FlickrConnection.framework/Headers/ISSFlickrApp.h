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
#import "SSFlickrUser.h"
#import "SSFlickrErrorInfo.h"
#import "SSFlickrCredential.h"
#import "SSFlickrPhoto.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method
 */
typedef enum
{
	SSFlickrRequestMethodGet = 0, /**< GET方式 */
	SSFlickrRequestMethodPost = 1, /**< POST方式 */
	SSFlickrRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSFlickrRequestMethod;

/**
 *	@brief	Flickr App Protocol.
 */
@protocol ISSFlickrApp <ISSPlatformApp>

/**
 *	@brief	Get consumer key.
 *
 *	@return	Consumer key.
 */
- (NSString *)consumerKey;

/**
 *	@brief	Get consumer secret.
 *
 *	@return	Consuemr secret.
 */
- (NSString *)consumerSecret;

/**
 *	@brief	Call api.
 *
 *	@param 	path 	API path string.
 *  @param  restMethod  REST API method name，If you specify this parameter can be ignored path, path will default to point http://ycpi.api.flickr.com/services/rest
 *	@param 	params 	Request parameters
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
 restMethod:(NSString *)restMethod
     method:(SSFlickrRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Upload image.
 *
 *	@param 	photo 	Image object.
 *	@param 	title 	Title string.
 *	@param 	description 	Image description。Contains restricted HTML。
 *	@param 	tags 	Apply to the photo space-separated list of labels。
 *	@param 	isPublic 	Set to 0 for no, 1 means yes. Specify who can view photos。
 *	@param 	isFriend 	Set to 0 for no, 1 means yes. Specify who can view photos。
 *	@param 	isFamily 	Set to 0 for no, 1 means yes. Specify who can view photos。
 *	@param 	safetyLevel 	Set to 1 "safe level", 2 "PG", 3 "X-rated"
 *	@param 	contentType 	Set to 1 is the "Photo", 2 "screen shots", 3 "Other."
 *	@param 	hidden 	Set to 1 is the "Photo", 2 "screen shots", 3 "Other."
 *  @param  result  Result handler.
 */
- (void)uploadPhoto:(id<ISSCAttachment>)photo
              title:(NSString *)title
        description:(NSString *)description
               tags:(NSString *)tags
           isPublic:(NSNumber *)isPublic
           isFriend:(NSNumber *)isFriend
           isFamily:(NSNumber *)isFamily
        safetyLevel:(NSNumber *)safetyLevel
        contentType:(NSNumber *)contentType
             hidden:(NSNumber *)hidden
             result:(SSShareResultEvent)result;

@end
