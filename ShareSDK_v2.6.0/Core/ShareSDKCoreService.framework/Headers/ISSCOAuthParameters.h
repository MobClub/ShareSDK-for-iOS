//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSCParameters.h"

/**
 *	@brief	OAuth参数
 */
@protocol ISSCOAuthParameters <ISSCParameters>

/**
 *	@brief	获取消费者Key
 *
 *	@return	消费者Key
 */
- (NSString *)consumerKey;

/**
 *	@brief	获取消费者密钥
 *
 *	@return	消费者密钥
 */
- (NSString *)consumerSecret;

/**
 *	@brief	获取OAuthToken
 *
 *	@return	OAuthToken
 */
- (NSString *)oauthToken;

/**
 *	@brief	获取OAuth密钥
 *
 *	@return	OAuth密钥
 */
- (NSString *)oauthSecret;


/**
 *	@brief	添加OAuth参数,仅用于OAuth1.0版本
 *
 *	@param 	name 	参数名称
 *	@param 	value 	参数值
 */
- (void)addOAuthParameter:(NSString *)name value:(id)value;

/**
 *	@brief	添加多个参数
 *
 *	@param 	parameters 	参数对象
 */
- (void)addOAuthParameters:(id<ISSCOAuthParameters>)parameters;

/**
 *	@brief	添加多个参数
 *
 *	@param 	dictionary 	参数字典
 */
- (void)addOAuthParametersWithDictionary:(NSDictionary *)dictionary;

/**
 *	@brief	获取OAuth参数值,仅用于OAuth1.0版本
 *
 *	@param 	name 	参数名称
 *
 *	@return	参数值
 */
- (id)oauthParameterWithName:(NSString *)name;

/**
 *	@brief	获取OAuth参数数量,仅用于OAuth1.0版本
 *
 *	@return	参数数量
 */
- (NSInteger)oauthParameterCount;

/**
 *	@brief	获取OAuth字典结构数据
 *
 *	@return	字典数据
 */
- (NSDictionary *)oauthDictionaryValue;

@end
