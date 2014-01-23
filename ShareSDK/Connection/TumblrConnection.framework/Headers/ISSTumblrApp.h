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
#import "SSTumblrUser.h"
#import "SSTumblrErrorInfo.h"
#import "SSTumblrCredential.h"
#import "SSTumblrPost.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request method
 */
typedef enum
{
	SSTumblrRequestMethodGet = 0, /**< GET方式 */
	SSTumblrRequestMethodPost = 1, /**< POST方式 */
	SSTumblrRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSTumblrRequestMethod;

/**
 *	@brief	Tumblr App
 */
@protocol ISSTumblrApp <ISSPlatformApp>

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
 *	@brief	Get callback url.
 *
 *	@return	Callback url.
 */
- (NSString *)callbackUrl;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized user, it means that if the incoming nil default authorized user
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSTumblrRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Create a post.
 *
 *	@param 	text 	Content string. can include html format
 *	@param 	title 	Title string.
 *	@param 	blogName 	Blog name，If you pass nil, then publish to the user's default blog
 *  @param  result  Result handler.
 */
- (void)postText:(NSString *)text
           title:(NSString *)title
        blogName:(NSString *)blogName
          result:(SSShareResultEvent)result;

/**
 *	@brief	Create a post with photo.
 *
 *	@param 	photo 	Image attachment object.
 *	@param 	caption 	Title string.
 *	@param 	url 	URL string.
 *	@param 	blogName 	Blog name，If you pass nil, then publish to the user's default blog
 *  @param  result  Result handler.
 */
- (void)postPhoto:(id<ISSCAttachment>)photo
          caption:(NSString *)caption
              url:(NSString *)url
         blogName:(NSString *)blogName
           result:(SSShareResultEvent)result;


@end
