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
#import "SSInstagramUser.h"
#import "SSInstagramErrorInfo.h"
#import "SSInstagramCredential.h"
#import <ShareSDK/ShareSDKPlugin.h>

/**
 *	@brief	Instagram request method.
 */
typedef enum
{
	SSInstagramRequestMethodGet = 0, /**< GET方式 */
	SSInstagramRequestMethodPost = 1, /**< POST方式 */
	SSInstagramRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSInstagramRequestMethod;

/**
 *	@brief	Instagram App Protocol.
 */
@protocol ISSInstagramApp <ISSPlatformApp>

/**
 *	@brief	Set menu container for iPad device.
 *
 *  @since  ver2.9.0
 *
 *	@param 	container 	Menu container.
 */
- (void)setIPadMenuContainer:(UIView *)container;

/**
 *	@brief	Get menu container for iPad device
 *
 *  @since  ver2.9.0
 *
 *	@return	Menu container.
 */
- (UIView *)iPadMenuContainer;

/**
 *	@brief	Set pop-up menu container frame for iPad device.
 *
 *  @since  ver2.9.0
 *
 *	@param 	rect    menu container frame
 */
- (void)setIPadMenuContainerFrame:(CGRect)frame;

/**
 *	@brief	Get pop-up menu container frame for iPad device.
 *
 *  @since  ver2.9.0
 *
 *	@return	menu container frame
 */
- (CGRect)iPadMenuContainerFrame;


/**
 *	@brief	Get client id.
 *
 *	@return	Client id string.
 */
- (NSString *)clientId;

/**
 *	@brief	Get client secret.
 *
 *	@return	Client secret string.
 */
- (NSString *)clientSecret;

/**
 *	@brief	Get redirect uri.
 *
 *	@return	Redirect uri string.
 */
- (NSString *)redirectUri;

/**
 *	@brief	Call api
 *
 *	@param 	path 	API path string.
 *	@param 	params 	Request parameters.
 *  @param  user    Authorized users, it means that if the incoming nil default authorized users
 *  @param  result  Result handler.
 *  @param  fault   Fault handler.
 */
- (void)api:(NSString *)path
     method:(SSInstagramRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(id<ISSPlatformUser>)user
     result:(void(^)(id responder))result
      fault:(void(^)(CMErrorInfo *error))fault;

/**
 *	@brief Open call Instagram camera.
 *
 *  @return YES open success. otherwise open failure.
 */
- (BOOL)openInstagramWithCamera;

/**
 *	@brief	Share content.
 *
 *	@param 	image 	Image attachment object.
 *	@param 	title 	Title string.
 *  @param  containerController     Container controller.
 *  @param  result  Result handler.
 */
- (void)shareWithImage:(id<ISSCAttachment>)image
                 title:(NSString *)title
   containerController:(UIViewController *)containerController
                result:(SSShareResultEvent)result;

/**
 *	@brief	Share content.
 *
 *  @since  ver2.9.0
 *
 *	@param 	image 	Image attachment object.
 *	@param 	title 	Title string.
 *  @param  container     Menu container.
 *  @param  containerFrame  Menu container frame.
 *  @param  result  Result handler.
 */
- (void)shareWithImage:(id<ISSCAttachment>)image
                 title:(NSString *)title
             container:(UIView *)container
        containerFrame:(CGRect)containerFrame
                result:(SSShareResultEvent)result;


@end
