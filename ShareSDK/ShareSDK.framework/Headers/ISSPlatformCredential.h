//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *	@brief	Authorized credential protocol
 */
@protocol ISSPlatformCredential <NSObject>

@required

/**
 *	@brief	Get user id.
 *
 *	@return	User id.
 */
- (NSString *)uid;

/**
 *	@brief	Get token, In OAuth is oauth_token property，In OAuth2 is access_token property
 *
 *	@return	Token string.
 */
- (NSString *)token;

/**
 *	@brief	Get secret，Only for OAuth authorization，is oauth_token_secret property。
 *
 *	@return Secret string.
 */
- (NSString *)secret;

/**
 *	@brief	Get a token expiration time. Only for OAuth2 authorization. Need to return to a time in seconds.
 *
 *	@return	expiration time.
 */
- (NSDate *)expired;

/**
 *	@brief	Get extension information
 *
 *	@return	Extension information dicationary.
 */
- (NSDictionary *)extInfo;

/**
 *	@brief	Get authorization credential validity
 *
 *	@return	YES is available. otherwise is not available.
 */
- (BOOL)available;


@end
