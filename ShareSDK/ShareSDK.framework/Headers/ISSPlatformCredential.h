//
//  ISSPlatformCredential.h
//  ShareSDK
//
//  Created by vimfung on 13-10-14.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	@brief	平台授权凭证协议
 */
@protocol ISSPlatformCredential <NSObject>

@required

/**
 *	@brief	获取用户标识
 *
 *	@return	用户标识
 */
- (NSString *)uid;

/**
 *	@brief	获取令牌,在OAuth中为oauth_token，在OAuth2中为access_token
 *
 *	@return	令牌
 */
- (NSString *)token;

/**
 *	@brief	获取令牌密钥，仅用于OAuth授权中，为oauth_token_secret。
 *
 *	@return 令牌密钥
 */
- (NSString *)secret;

/**
 *	@brief	获取令牌过期时间，仅用于OAuth2授权中，需要将返回的秒数转换为时间。
 *
 *	@return	令牌过期时间
 */
- (NSDate *)expired;

/**
 *	@brief	获取其他扩展信息
 *
 *	@return	扩展信息
 */
- (NSDictionary *)extInfo;

/**
 *	@brief	获取授权凭证的有效性
 *
 *	@return	授权凭证的有效性
 */
- (BOOL)available;


@end
