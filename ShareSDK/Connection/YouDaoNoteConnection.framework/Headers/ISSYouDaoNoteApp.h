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
#import "ISSYouDaoNoteAuthSession.h"
#import "SSYouDaoNoteUser.h"
#import "SSYouDaoNoteErrorInfo.h"
#import "SSYouDaoNoteNote.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Request Method
 */
typedef enum
{
	SSYouDaoNoteRequestMethodGet = 0, /**< GET方式 */
	SSYouDaoNoteRequestMethodPost = 1, /**< POST方式 */
	SSYouDaoNoteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSYouDaoNoteRequestMethod;

/**
 *	@brief	YouDaoNote App
 */
@protocol ISSYouDaoNoteApp <ISSPlatformApp>

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
 *	@brief	Call API.
 *
 *	@param 	path 	API path string.
 *  @param  method  Request method.
 *	@param 	params  Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSYouDaoNoteRequestMethod)method
     params:(id<ISSCOAuthParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Upload resource.
 *
 *	@param 	file 	File attachment.
 *  @param  result  Result handler.
 */
- (void)uploadResource:(id<ISSCAttachment>)file
                result:(void(^)(BOOL result, id resource, CMErrorInfo *error))result;

/**
 *	@brief	Create a note.
 *
 *	@param 	content 	Content string.
 *	@param 	source 	Source.
 *	@param 	author 	Author.
 *	@param 	title 	Title string.
 *	@param 	notebook 	Notebook path.
 *  @param  result  Result handler.
 */
- (void)createNote:(NSString *)content
            source:(NSString *)source
            author:(NSString *)author
             title:(NSString *)title
          notebook:(NSString *)notebook
            result:(SSShareResultEvent)result;


@end
