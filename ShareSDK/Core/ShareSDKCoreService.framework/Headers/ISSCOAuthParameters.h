//
//  Created by ShareSDK.cn on 13-1-14.
//  Website:http://www.ShareSDK.cn
//  Support E-mail:support@sharesdk.cn
//  WeChat ID:ShareSDK   （If publish a new version, we will be push the updates content of version to you. If you have any questions about the ShareSDK, you can get in touch through the WeChat with us, we will respond within 24 hours）
//  Business QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ISSCParameters.h"

/**
 *	@brief	OAuth parameters.
 */
@protocol ISSCOAuthParameters <ISSCParameters>

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
 *	@brief	Get Oauth token.
 *
 *	@return	OAuth token.
 */
- (NSString *)oauthToken;

/**
 *	@brief	Get OAuth secret.
 *
 *	@return	OAuth secret.
 */
- (NSString *)oauthSecret;

/**
 *	@brief	Add OAuth parameters. Only for OAuth
 *
 *	@param 	name 	Parameter name.
 *	@param 	value 	Parameter value.
 */
- (void)addOAuthParameter:(NSString *)name value:(id)value;

/**
 *	@brief	Adding multiple parameters
 *
 *	@param 	parameters 	Parameters object.
 */
- (void)addOAuthParameters:(id<ISSCOAuthParameters>)parameters;

/**
 *	@brief	Adding multiple parameters
 *
 *	@param 	dictionary 	Parameters dictionary.
 */
- (void)addOAuthParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	Get OAuth parameter value, Only for OAuth.
 *
 *	@param 	name 	Parameter name.
 *
 *	@return	Parameter value.
 */
- (id)oauthParameterWithName:(NSString *)name;

/**
 *	@brief	Get parameters count. only for OAuth.
 *
 *	@return	Parameters count.
 */
- (NSInteger)oauthParameterCount;

/**
 *	@brief	Get OAuth dictionary object.
 *
 *	@return	Dictionary object.
 */
- (NSDictionary *)oauthDictionaryValue;

@end
