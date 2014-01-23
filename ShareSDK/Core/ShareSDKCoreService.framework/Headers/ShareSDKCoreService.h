//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ISSCAccount.h"
#import "ISSCRequest.h"
#import "ISSCToken.h"
#import "ISSCOpenApp.h"
#import "ISSCOAuthParameters.h"
#import "ISSCAuthSession.h"
#import "ISSCAttachment.h"
#import "SSCNotificationDef.h"
#import "SSCKeyDef.h"
#import "SSCTypeDef.h"
#import "ISSCDataObject.h"
#import "SSCLocationCoordinate2D.h"

/**
 *	@brief	ShareSDK core service.
 */
@interface ShareSDKCoreService : NSObject

/**
 *	@brief	Use app key login
 *
 *	@param 	appKey 	App key.
 *
 *	@return	Account information.
 */
+ (id<ISSCAccount>)loginWithAppKey:(NSString *)appKey;

/**
 *	@brief	Check whether the account has logged
 *
 *	@param 	account 	Account information.
 *
 *	@return	YES means the login, NO indicates not logged in
 */
+ (BOOL)hasLogined:(id<ISSCAccount>)account;

/**
 *	@brief	Create a parameters.
 *
 *	@return	Parameters object.
 */
+ (id<ISSCParameters>)parameters;

/**
 *	@brief	Create a parameters.
 *
 *	@param 	query 	The URL query string.
 *
 *	@return	Parameters
 */
+ (id<ISSCParameters>)parametersWithQuery:(NSString *)query;

/**
 *	@brief	Create OAuth request parameters.
 *
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret.
 *  @param  oauthToken  OAuth token.
 *  @param  oauthSecret OAuth secret.
 *
 *	@return	OAuth parameters.
 */
+ (id<ISSCOAuthParameters>)oauthParameters:(NSString *)consumerKey
                            consumerSecret:(NSString *)consumerSecret
                                oauthToken:(NSString *)oauthToken
                               oauthSecret:(NSString *)oauthSecret;

/**
 *	@brief	Create OAuth request parameters.
 *
 *	@param 	consumerKey 	Consumer key.
 *	@param 	consumerSecret 	Consumer secret
 *  @param  oauthToken  OAuth token.
 *  @param  oauthSecret OAuth secret.
 *  @param  query   The URL query string
 *
 *	@return	OAuth parameters.
 */
+ (id<ISSCOAuthParameters>)oauthParameters:(NSString *)consumerKey
                            consumerSecret:(NSString *)consumerSecret
                                oauthToken:(NSString *)oauthToken
                               oauthSecret:(NSString *)oauthSecret
                                     query:(NSString *)query;

/**
 *	@brief	Send request.
 *
 *	@param 	account 	Account information.
 *
 *	@return	Request object, return nil if it means that the account has not been authorized by
 */
+ (id<ISSCRequest>)requestWithAccount:(id<ISSCAccount>)account;

/**
 *	@brief	Create attachment object.
 *
 *	@param 	path 	File path.
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)attachmentWithPath:(NSString *)path;

/**
 *	@brief	Create attachment object.
 *
 *	@param 	url 	URL string.
 *
 *	@return	Attachment object.
 */
+ (id<ISSCAttachment>)attachmentWithUrl:(NSString *)url;

/**
 *	@brief	Create attachment data.
 *
 *	@param 	data 	File data.
 *	@param 	fileName 	File name.
 *	@param 	mimeType 	MIME type
 *
 *	@return	Attachment data.
 */
+ (id<ISSCAttachment>)attachmentWithData:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType;

/**
 *	@brief	OAuth signatures
 *
 *	@param 	url 	URL string.
 *	@param 	method 	Request method.
 *	@param 	parameters 	Parameters.
 *	@param 	consumerSecret 	Consumer secret.
 *	@param 	oauthTokenSecret 	OAuth token secret.
 *
 *	@return	Sinature string
 */
+ (NSString *)oauthSignatureWithURL:(NSURL *)url
                             method:(NSString *)method
                         parameters:(id<ISSCParameters>)parameters
                     consumerSecret:(NSString *)consumerSecret
                   oauthTokenSecret:(NSString *)oauthTokenSecret;

/**
 *	@brief	Get localizable string
 *
 *	@param 	name 	Name
 *	@param 	comment 	Comment
 *
 *	@return	String object.
 */
+ (NSString *)localizableString:(NSString *)name comment:(NSString *)comment;

/**
 *	@brief	Get Image object
 *
 *	@param 	name 	Bundle name.
 *
 *	@return	Image object.
 */
+ (UIImage *)imageNamed:(NSString *)name;


@end
