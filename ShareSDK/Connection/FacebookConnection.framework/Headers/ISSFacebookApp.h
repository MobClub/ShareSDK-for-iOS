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
#import "SSFacebookUser.h"
#import "SSFacebookErrorInfo.h"
#import "SSFacebookPost.h"
#import "ISSFacebookAddFriendDialog.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Facebook request method.
 */
typedef enum
{
	SSFacebookRequestMethodGet = 0, /**< GET方式 */
	SSFacebookRequestMethodPost = 1, /**< POST方式 */
	SSFacebookRequestMethodMultipartPost = 2, /**< Multipart POST方式，用于上传文件的api接口 */
    SSFacebookRequestMethodDelete = 3   /**< DELETE方式 */
}
SSFacebookRequestMethod;

/**
 *	@brief	Add Friend Dialog diaplay handler.
 */
typedef void(^SSFacebookShowAddFriendDialog) (UIViewController *viewController);

/**
 *	@brief	Add Friend Dialog close handler.
 */
typedef void(^SSFacebookCloseAddFriendDialog) (UIViewController *viewController);

/**
 *	@brief	Facebook App Protocol
 */
@protocol ISSFacebookApp <ISSPlatformApp>

/**
 *	@brief	Get App key.
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
 *	@brief	Get SSO Login callback URL.
 *
 *	@return	URL string.
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	Set add friend dialog Handler.
 *
 *	@param 	showHandler 	Display handler.
 *  @param  closeHandler    Close handler.
 */
- (void)setAddFriendDialogWithShowHandler:(SSFacebookShowAddFriendDialog)showHandler
                             closeHandler:(SSFacebookCloseAddFriendDialog)closeHandler;
							 
/**
 *	@brief	Set add friend dialog delegate.
 *
 *	@param 	delegate 	Delegate object.
 */
- (void)setAddFriendDialogDelegate:(id<ISSViewDelegate>)delegate;

/**
 *	@brief	Call API
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authoried user. If the incoming nil indicates the default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSFacebookRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief	Send message
 *
 *	@param 	message 	Message content.
 *  @param  result      Result handler.
 */
- (void)feedWithMessage:(NSString *)message
                 result:(SSShareResultEvent)result;

/**
 *	@brief	Send message.
 *
 *	@param 	message 	Message content.
 *	@param 	source 	Image attachment object.
 *  @param  result  Result handler.
 */
- (void)feedWithMessage:(NSString *)message
                 source:(id<ISSCAttachment>)source
                 result:(SSShareResultEvent)result;
				 
/**
 *	@brief	Get post information.
 *
 *	@param 	postId 	Post id.
 */
- (void)getPostWithId:(NSString *)postId
               result:(void(^)(BOOL result, id post, CMErrorInfo *error))result;


@end
