//
//  ISSGooglePlusApp.h
//  GooglePlusConnection
//
//  Created by 冯 鸿杰 on 13-8-12.
//  Copyright (c) 2013年 掌淘科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISSGooglePlusAuthSession.h"
#import "SSGooglePlusUser.h"
#import "SSGooglePlusErrorInfo.h"
#import "SSGooglePlusCredential.h"
#import "SSGooglePlusMoment.h"
#import "SSGooglePlusShareInfo.h"

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SSGooglePlusRequestMethodGet = 0, /**< GET方式 */
	SSGooglePlusRequestMethodPost = 1, /**< POST方式 */
	SSGooglePlusRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SSGooglePlusRequestMethod;

/**
 *	@brief	Google+应用协议
 */
@protocol ISSGooglePlusApp <ISSCOpenApp>

/**
 *	@brief	获取授权帐号
 *
 *	@return	授权帐号
 */
- (id<ISSCAccount>)account;

/**
 *	@brief	获取应用Key
 *
 *	@return	应用Key
 */
- (NSString *)clientId;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)clientSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

/**
 *	@brief	获取SSO回调地址列表
 *
 *	@return	回调地址列表
 */
- (NSString *)ssoCallbackUrl;

/**
 *	@brief	SSO登录使能状态
 */
- (BOOL)ssoEnabled;

/**
 *	@brief	设置SSO登录使能状态
 */
- (void)setSsoEnabled:(BOOL)ssoEnabled;

/**
 *	@brief	获取是否转换链接标识
 *
 *	@return	YES 表示转换链接，NO 表示不转换链接
 */
- (BOOL)convertUrlEnabled;

/**
 *	@brief	设置是否转换链接标识
 *
 *	@param 	enabled 	YES 表示转换链接，NO 表示不转换链接
 */
- (void)setConvertUrlEnabled:(BOOL)enabled;

/**
 *	@brief	授权应用
 *
 *	@return	授权会话
 */
- (id<ISSGooglePlusAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SSGooglePlusUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SSGooglePlusUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SSGooglePlusUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SSGooglePlusUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SSGooglePlusUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SSGooglePlusErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SSGooglePlusCredential *)credential;

/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *
 *	@return	YES 表示接受请求 NO 表示不接受
 */
- (BOOL)handleOpenURL:(NSURL *)url;

/**
 *	@brief	处理请求打开链接
 *
 *	@param 	url 	链接
 *	@param 	sourceApplication 	源应用
 *	@param 	annotation 	源应用提供的信息
 *
 *	@return	YES 表示接受请求，NO 表示不接受请求
 */
- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数，可以为ISSParameter或者NSDictionary，(NSDictionary仅用于POST提交方式）
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SSGooglePlusRequestMethod)method
     params:(id)params
       user:(SSGooglePlusUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SSGooglePlusErrorInfo *error))fault;

/**
 *	@brief	显示默认授权用户信息
 *
 *  @param  result  回调方法
 */
- (void)showMe:(void(^)(BOOL result, SSGooglePlusUser *userInfo, SSGooglePlusErrorInfo *error))result;

/**
 *	@brief	分享内容
 *
 *	@param 	url 	链接
 *	@param 	text        分享内容
 */
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
              result:(void (^)(SSCShareSessionState state, SSGooglePlusShareInfo *status, SSGooglePlusErrorInfo *error))result;


/**
 *	@brief	分享内容
 *
 *	@param 	url 	链接
 *	@param 	text        分享内容
 *	@param 	deepLinkId  深链接ID
 *	@param 	title 	深链接标题
 *	@param 	description 	深链接描述
 *	@param 	thumbnail 	深链接缩略图
 */
- (void)shareWithUrl:(NSString *)url
                text:(NSString *)text
          deepLinkId:(NSString *)deepLinkId
               title:(NSString *)title
         description:(NSString *)description
           thumbnail:(NSString *)thumbnail
              result:(void (^)(SSCShareSessionState, SSGooglePlusShareInfo *status, SSGooglePlusErrorInfo *error))result;




@end
