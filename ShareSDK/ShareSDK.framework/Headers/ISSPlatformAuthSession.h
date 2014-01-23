//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSPlatformCredential.h"

/**
 *	@brief	Authorized result event.
 */
typedef void(^SSAuthResultEvent) (SSResponseState state, id<ISSPlatformCredential> credential, CMErrorInfo *error);

/**
 *	@brief	Authorized session protocol.
 */
@protocol ISSPlatformAuthSession <NSObject>

@required

/**
 *	@brief	Get platform type.
 *
 *	@return	Platform type. please see ShareType.
 */
- (ShareType)type;

/**
 *	@brief	Start Authorized
 *
 *  @param  allowCallback   Whether to allow callbacks to the server，Default YES, the server-side app for free or no callback authorization data to the server app can be set to NO.
 *  @param  ssoLogin    SSO authorized enabled，YES indicate priority SSO authorize. otherwise authorized to use the Web authorized
 *  @param  scopes  Scopes list array.
 *	@param 	result 	Result handler
 */
- (void)startWithAllowCallback:(BOOL)allowCallback
                      ssoLogin:(BOOL)ssoLogin
                        scopes:(NSArray *)scopes
                        result:(SSAuthResultEvent)result;
/**
 *	@brief	Cancel authorized.
 */
- (void)cancel;

/**
 *	@brief	Get authorized view. Returns nil if it means using the SSO login mode。(Note: Please call the start method after using this property, otherwise constant returns nil.)
 *
 *	@return	Authorized view.
 */
- (UIView *)view;

/**
 *	@brief	SSO Login flag.(Note: Please call the start method after using this property, otherwise constant returns nil.)
 *
 *	@return	YES indicate is SSO login. otherwise is Web login.
 */
- (BOOL)isSSOLogin;


@end
