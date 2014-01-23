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
#import "SSVKontakteUser.h"
#import "SSVKontakteErrorInfo.h"
#import "SSVKontakteCredential.h"
#import "SSVKontaktePost.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	VKontakte request method
 */
typedef enum
{
	SSVKontakteRequestMethodGet = 0, /**< GET方式 */
	SSVKontakteRequestMethodPost = 1, /**< POST方式 */
	SSVKontakteRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSVKontakteRequestMethod;

/**
 *	@brief	VKontakte App
 */
@protocol ISSVKontakteApp <ISSPlatformApp>


/**
 *	@brief	 Get app key
 *
 *	@return	App key
 */
- (NSString *)appKey;

/**
 *	@brief	Get secret key
 *
 *	@return	Secret key.
 */
- (NSString *)secretKey;

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
     method:(SSVKontakteRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Publish a Wall Post.
 *
 *	@param 	message 	Content string, if not set attachments, was required.
 *	@param 	attachments 	Attachment list，if not set message, was required.
 *  @param  url     URL string.
 *  @param  groupId     Group id,When setting up attachments parameters required。
 *	@param 	friendsOnly 	Whether to allow only friends to view
 *	@param 	locationCoordinate 	Position when publish post.
 *  @param  result    Result hanlder.
 */
- (void)wallPostWithMessage:(NSString *)message
                attachments:(NSArray *)attachments
                        url:(NSString *)url
                    groupId:(NSString *)groupId
                friendsOnly:(NSNumber *)friendsOnly
         locationCoordinate:(SSCLocationCoordinate2D *)locationCoordinate
                     result:(SSShareResultEvent)result;


@end
