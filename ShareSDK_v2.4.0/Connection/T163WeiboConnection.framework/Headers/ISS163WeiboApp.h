//
//  Created by ShareSDK.cn on 13-1-14.
//  官网地址:http://www.ShareSDK.cn
//  技术支持邮箱:support@sharesdk.cn
//  官方微信:ShareSDK   （如果发布新版本的话，我们将会第一时间通过微信将版本更新内容推送给您。如果使用过程中有任何问题，也可以通过微信与我们取得联系，我们将会在24小时内给予回复）
//  商务QQ:4006852216
//  Copyright (c) 2013年 ShareSDK.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDKCoreService/ShareSDKCoreService.h>
#import "ISS163WeiboAuthSession.h"
#import "SS163WeiboUser.h"
#import "SS163WeiboErrorInfo.h"

/**
 *	@brief	新浪微博请求方式
 */
typedef enum
{
	SS163WeiboRequestMethodGet = 0, /**< GET方式 */
	SS163WeiboRequestMethodPost = 1, /**< POST方式 */
	SS163WeiboRequestMethodMultipartPost = 2 /**< Multipart POST方式，用于上传文件的api接口 */
}
SS163WeiboRequestMethod;

/**
 *	@brief	网易微博应用协议
 */
@protocol ISS163WeiboApp <ISSCOpenApp>

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
- (NSString *)appKey;

/**
 *	@brief	获取应用密钥
 *
 *	@return	应用密钥
 */
- (NSString *)appSecret;

/**
 *	@brief	获取应用回调地址
 *
 *	@return	应用回调地址
 */
- (NSString *)redirectUri;

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
- (id<ISS163WeiboAuthSession>)authorize;

/**
 *	@brief	注册用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注册成功， NO 表示注册失败
 */
- (BOOL)registerUser:(SS163WeiboUser *)user;

/**
 *	@brief	注销用户信息
 *
 *	@param 	user 	用户信息
 *
 *	@return	YES 表示注销成功， NO 表示注销失败
 */
- (BOOL)unregisterUser:(SS163WeiboUser *)user;

/**
 *	@brief	获取注册用户信息
 *
 *	@param 	uid 	用户ID
 *
 *	@return	返回用户信息，nil表示尚未注册
 */
- (SS163WeiboUser *)getUser:(NSString *)uid;

/**
 *	@brief	获取默认注册用户
 *
 *	@return	默认注册用户
 */
- (SS163WeiboUser *)defaultUser;

/**
 *	@brief	设置默认注册用户
 *
 *	@param 	defaultUser 	默认注册用户
 */
- (void)setDefaultUser:(SS163WeiboUser *)defaultUser;

/**
 *	@brief	检测用户是否已授权
 *
 *	@param 	error 	错误信息
 *
 *	@return	YES 表示没有授权，NO 表示已授权
 */
- (BOOL)checkUnauthWithError:(SS163WeiboErrorInfo *)error;

/**
 *	@brief	设置凭证
 *
 *	@param 	credential 	授权凭证信息
 */
- (void)setCredential:(SS163WeiboCredential *)credential;

/**
 *	@brief	调用开放平台API
 *
 *	@param 	path 	路径
 *	@param 	params 	请求参数
 *  @param  user    授权用户,如果传入nil则表示默认的授权用户
 *  @param  result  返回回调
 *  @param  fault   失败回调
 */
- (void)api:(NSString *)path
     method:(SS163WeiboRequestMethod)method
     params:(id<ISSCParameters>)params
       user:(SS163WeiboUser *)user
     result:(void(^)(id responder))result
      fault:(void(^)(SS163WeiboErrorInfo *error))fault;

/**
 *	@brief	显示当前授权用户信息
 *  
 *  @result 返回回调
 */
- (void)showMe:(void(^)(BOOL result, SS163WeiboUser *user, SS163WeiboErrorInfo *error))result;

/**
 *	@brief	发布微博信息
 *
 *	@param 	status 	微博内容
 *  @param  result  返回回调
 */
- (void)updateWithStatus:(NSString *)status
                  result:(void(^)(SSCShareSessionState state, SS163WeiboStatus *status, SS163WeiboErrorInfo *error))result;

/**
 *	@brief	上传图片
 *
 *	@param 	pic 	图片
 *  @param  result  返回回调
 */
- (void)uploadPic:(id<ISSCAttachment>)pic
           result:(void(^)(BOOL result, NSString *uploadImageUrl, SS163WeiboErrorInfo *error))result;


@end
