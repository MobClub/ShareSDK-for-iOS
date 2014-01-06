//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
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
 *	@brief	ShareSDK核心服务层
 */
@interface ShareSDKCoreService : NSObject

/**
 *	@brief	使用AppKey进行登录
 *
 *	@param 	appKey 	应用标志
 *
 *	@return	登录帐户对象
 */
+ (id<ISSCAccount>)loginWithAppKey:(NSString *)appKey;

/**
 *	@brief	检查帐号是否已经登录
 *
 *	@param 	account 	登录帐号
 *
 *	@return	YES表示登录，NO表示尚未登录
 */
+ (BOOL)hasLogined:(id<ISSCAccount>)account;

/**
 *	@brief	创建请求参数
 *
 *	@return	请求参数对象
 */
+ (id<ISSCParameters>)parameters;

/**
 *	@brief	创建请求参数
 *
 *	@param 	query 	URL中的query字符串
 *
 *	@return	请求参数对象
 */
+ (id<ISSCParameters>)parametersWithQuery:(NSString *)query;

/**
 *	@brief	创建OAuth请求参数
 *
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 *  @param  oauthToken  OAuth令牌
 *  @param  oauthSecret OAuth密钥
 *
 *	@return	OAuth请求参数
 */
+ (id<ISSCOAuthParameters>)oauthParameters:(NSString *)consumerKey
                            consumerSecret:(NSString *)consumerSecret
                                oauthToken:(NSString *)oauthToken
                               oauthSecret:(NSString *)oauthSecret;

/**
 *	@brief	创建OAuth请求参数
 *
 *	@param 	consumerKey 	消费者Key
 *	@param 	consumerSecret 	消费者密钥
 *  @param  oauthToken  OAuth令牌
 *  @param  oauthSecret OAuth密钥
 *  @param  query   URL中的query字符串
 *
 *	@return	OAuth请求参数
 */
+ (id<ISSCOAuthParameters>)oauthParameters:(NSString *)consumerKey
                            consumerSecret:(NSString *)consumerSecret
                                oauthToken:(NSString *)oauthToken
                               oauthSecret:(NSString *)oauthSecret
                                     query:(NSString *)query;

/**
 *	@brief	获取请求
 *
 *	@param 	account 	授权帐号
 *
 *	@return	请求对象,如果返回nil则表示帐户尚未通过授权
 */
+ (id<ISSCRequest>)requestWithAccount:(id<ISSCAccount>)account;

/**
 *	@brief	创建附件
 *
 *	@param 	path 	文件路径
 *
 *	@return	附件对象
 */
+ (id<ISSCAttachment>)attachmentWithPath:(NSString *)path;

/**
 *	@brief	创建附件
 *
 *	@param 	url 	文件网络地址
 *
 *	@return	附件对象
 */
+ (id<ISSCAttachment>)attachmentWithUrl:(NSString *)url;

/**
 *	@brief	创建附件
 *
 *	@param 	data 	文件数据
 *	@param 	fileName 	文件名称
 *	@param 	mimeType 	MIME类型
 *
 *	@return	附件对象
 */
+ (id<ISSCAttachment>)attachmentWithData:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType;

/**
 *	@brief	OAuth签名
 *
 *	@param 	url 	URL
 *	@param 	method 	请求方法GET或POST
 *	@param 	parameters 	参数
 *	@param 	consumerSecret 	消费者密钥
 *	@param 	oauthTokenSecret 	OAuth令牌密钥
 *  
 *	@return	签名值
 */
+ (NSString *)oauthSignatureWithURL:(NSURL *)url
                             method:(NSString *)method
                         parameters:(id<ISSCParameters>)parameters
                     consumerSecret:(NSString *)consumerSecret
                   oauthTokenSecret:(NSString *)oauthTokenSecret;

/**
 *	@brief	获取SDK本地化字符串资源
 *
 *	@param 	name 	名称
 *	@param 	comment 	描述
 *
 *	@return	字符串资源
 */
+ (NSString *)localizableString:(NSString *)name comment:(NSString *)comment;

/**
 *	@brief	获取SDK的图片资源
 *
 *	@param 	name 	名称
 *
 *	@return	图片资源
 */
+ (UIImage *)imageNamed:(NSString *)name;


@end
